class HardWorker
	include Sidekiq::Worker
	sidekiq_options retry: false

	def perform()
		puts "Running locations"
		locations
		puts "Running Levels"
		levels
		puts "Running Skills"
		skills
		puts "Running people"
		people
		puts "Running classes"
		classes
		puts "Running student levels"
		student_levels
		puts "Running student skills"
		student_skills
		puts "Running student lesson bookings"
		lesson_bookings
	end

	def locations
	  # Locations is an extract from Links Locations table
	  # It defines all of the locations for the company

	  # Connect to FTP Server and get CSV File
	  ftp = Net::FTP.new
	  ftp.connect("203.13.68.170",21)
	  ftp.login("swimdesk@ftp.cityvenuemanagement.com.au","Axs4swim")
	  ftp.chdir("/")
	  ftp.passive = true
	  # Save to file to a tmp_path
	  ftp.getbinaryfile("CodeCabin_Locations.csv", "tmp_path")
	  # Open the tmp_path
	    csv_text = open("tmp_path")
	  csv = CSV.parse(csv_text, :headers=>true)

	  # Now link through the csv saving each record appropriatly, ignoring the first line
	  csv.drop(1).each do |row|
	    data = row.to_s.split(",")
	    if data[1].present?
	    DsLinksLocation.create(
	      source_id: data[0],
	      location_name: data[1],
	      description: data[2]
	      )
	    end
	  end
	end

	def levels
	  # Levels is an extract from Links ClassLevels table
	  # It defines all of the levels setup for the company

	  # Connect to FTP Server and get CSV File
	  ftp = Net::FTP.new
	  ftp.connect("203.13.68.170",21)
	  ftp.login("swimdesk@ftp.cityvenuemanagement.com.au","Axs4swim")
	  ftp.chdir("/")
	  ftp.passive = true
	  # Save to file to a tmp_path
	  ftp.getbinaryfile("CodeCabin_Levels.csv", "tmp_path")
	  # Open the tmp_path
	  csv_text = open("tmp_path")
	  csv = CSV.parse(csv_text, :headers=>true)

	  # Now link through the csv saving each record appropriatly, ignoring the first line
	  csv.drop(1).each do |row|
	    data = row.to_s.split(",")
	    if data[1].present?
	    DsLinksLevel.create(
	      source_id: data[0],
	      description: data[1],
	      color: data[2]
	      )
	    end
	  end

	  
	end

	def skills
	  # Skills is an extract from Links ClassLevelSkills table
	  # It defines all of the skills setup for the company
	  ## NOTE: A skill belongs to a level, there are multiple skills to one level

	  # Connect to FTP Server and get CSV File
	  ftp = Net::FTP.new
	  ftp.connect("203.13.68.170",21)
	  ftp.login("swimdesk@ftp.cityvenuemanagement.com.au","Axs4swim")
	  ftp.chdir("/")
	  ftp.passive = true
	  # Save to file to a tmp_path
	  ftp.getbinaryfile("CodeCabin_Skills.csv", "tmp_path")
	  # Open the tmp_path
	  csv_text = open("tmp_path")
	  csv = CSV.parse(csv_text, :headers=>true)

	  # Now link through the csv saving each record appropriatly, ignoring the first line
	  # We reference the level by the ds_links_level_id method
	  csv.drop(1).each do |row|
	    data = row.to_s.split(",")
	    if data[1].present?
	    # The data source is messy, especially in the skill col.
	    # We need to clean it
	    refactor_skill = data[2].gsub('-', 'CodeCabin').split("CodeCabin").drop(1).join("").strip

	    # We need to find the parent level first
	    get_level = DsLinksLevel.where(description: data[1]).last
	    # Only if we find it should we create the level
	    if get_level.present? && refactor_skill.present?
	      DsLinksSkill.create(
	        source_id: data[0],
	        ds_links_level_id: get_level.id,
	        skill: refactor_skill,
	        priority: data[3].to_i,
	        description: data[4],
	        active: data[5] == "1" ? true : false
	        )
	    end
	    #We need to get rid of assesment and skills records
	    DsLinksSkill.where(skill: "assessment").all.destroy_all
	    DsLinksSkill.where(skill: "skills").all.destroy_all

	    end
	  end

	  # Let's clean up the levels
	  # We can delete all the levels now without a skill attached
	  @skills = DsLinksSkill.all.pluck(:ds_links_level_id)
	  @levels = DsLinksLevel.where(id: @skills).all.pluck(:id)
	  @redundant_levels = DsLinksLevel.where.not(id: @levels).all
	  @redundant_levels.destroy_all

	  
	end

	def people
	  # people is an extract from Links people table
	  # It defines all of the people, students, parents, teachers which are dynamically added

	  # Connect to FTP Server and get CSV File
	  ftp = Net::FTP.new
	  ftp.connect("203.13.68.170",21)
	  ftp.login("swimdesk@ftp.cityvenuemanagement.com.au","Axs4swim")
	  ftp.chdir("/")
	  ftp.passive = true
	  # Save to file to a tmp_path
	  ftp.getbinaryfile("CodeCabin_People.csv", "tmp_path")
	  # Open the tmp_path
	  csv_text = open("tmp_path")
	  csv = CSV.parse(csv_text, :headers=>true)

	  # Now link through the csv saving each record appropriatly, ignoring the first line
	  csv.drop(1).each do |row|
	    puts "start"
	    puts row
	    data = row.to_s.split(",")
	    #find location
	    found_location = DsLinksLocation.where(source_id: data[14].to_i).last
	      DsLinksPerson.create(
	        source_id: data[0],
	        surname: data[1],
	        given_name: data[2],
	        title: data[3],
	        date_of_birth: data[4],
	        gender: data[5],
	        address: data[6],
	        suburb: data[7],
	        postcode: data[8],
	        home_phone: data[9],
	        work_phone: data[10],
	        mobile_phone: data[11],
	        email: data[12],
	        email_secondary: data[13],
	        ds_links_location_id: found_location.present? ? found_location.id : nil,
	        state: data[15]
	        )
	  end

	   
	end

	def classes
	  # Classes is an extract from Links classes table
	  # It defines all of the classes which are added to links
	  # A lessonbooking belongs to a class which holds lesson day time max students etc

	  # Connect to FTP Server and get CSV File
	  ftp = Net::FTP.new
	  ftp.connect("203.13.68.170",21)
	  ftp.login("swimdesk@ftp.cityvenuemanagement.com.au","Axs4swim")
	  ftp.chdir("/")
	  ftp.passive = true
	  # Save to file to a tmp_path
	  ftp.getbinaryfile("CodeCabin_Classes.csv", "tmp_path")
	  # Open the tmp_path
	  csv_text = open("tmp_path")
	  csv = CSV.parse(csv_text, :headers=>true)

	  # Now link through the csv saving each record appropriatly, ignoring the first line
	  csv.drop(1).each do |row|
	    found_person = DsLinksPeople.where(source_id: data[6].to_i).last
	    found_location = DsLinksLocation.where(source_id: data[8].to_i).last
	    found_level = DsLinksLevel.where(source_id: data[9].to_i).last
	    data = row.to_s.split(",")
	      DsLinksClass.create(
	        source_id: data[0],
	        start_date: data[1],
	        end_date: data[2],
	        lesson_day: data[3],
	        lesson_start: data[4],
	        lesson_end: data[5],
	        ds_links_people_id: found_person.present? ? found_person.id : nil,
	        max_students: data[7],
	        ds_links_location_id: found_location.present? ? found_location.id : nil,
	        ds_links_level_id: found_level.present? ? found_level.id : nil
	      )
	  end

	   
	end

	def student_levels
	  # StudentLevel is an extract from Links StudentLevel table
	  # It defines all of the the level in which a student is at and the date in which it has been attained if any

	  # Connect to FTP Server and get CSV File
	  ftp = Net::FTP.new
	  ftp.connect("203.13.68.170",21)
	  ftp.login("swimdesk@ftp.cityvenuemanagement.com.au","Axs4swim")
	  ftp.chdir("/")
	  ftp.passive = true
	  # Save to file to a tmp_path
	  ftp.getbinaryfile("CodeCabin_StudentLevels.csv", "tmp_path")
	  # Open the tmp_path
	  csv_text = open("tmp_path")
	  csv = CSV.parse(csv_text, :headers=>true)

	  # Now link through the csv saving each record appropriatly, ignoring the first line
	  csv.drop(1).each do |row|
	    data = row.to_s.split(",")
	      found_people = DsLinksPeople.where(source_id: data[2].to_i).last
	      found_level = DsLinksLevel.where(description: data[3]).last

	      DsLinksStudentLevel.create(
	        source_id: data[0],
	        date_started: data[1],
	        ds_links_people_id: found_people.present? ? found_people.id : nil,
	        ds_links_level_id: found_level.present? ? found_level.id : nil,
	        date_attained: data[5],
	      )
	  end

	   
	end

	def student_skills
	  # StudentSkills is an extract from Links StudentLevelSkills table
	  # It defines all of the skills in which a student is at and the date in which it has been attained if any

	  # Connect to FTP Server and get CSV File
	  ftp = Net::FTP.new
	  ftp.connect("203.13.68.170",21)
	  ftp.login("swimdesk@ftp.cityvenuemanagement.com.au","Axs4swim")
	  ftp.chdir("/")
	  ftp.passive = true
	  # Save to file to a tmp_path
	  ftp.getbinaryfile("CodeCabin_StudentLevels.csv", "tmp_path")
	  # Open the tmp_path
	  csv_text = open("tmp_path")
	  csv = CSV.parse(csv_text, :headers=>true)

	  # Now link through the csv saving each record appropriatly, ignoring the first line
	  csv.drop(1).each do |row|
	    data = row.to_s.split(",")
	      found_people = DsLinksPeople.where(source_id: data[2].to_i).last
	      found_skill = DsLinksSkill.where(source_id: data[3].to_i).last

	      DsLinksStudentSkill.create(
	        source_id: data[0],
	        date_started: data[1],
	        ds_links_people_id: found_people.present? ? found_people.id : nil,
	        ds_links_skill_id: found_skill.present? ? found_skill.id : nil,
	        date_attained: data[4],
	      )
	  end

	   
	end

	def lesson_bookings
	  # StudentSkills is an extract from Links StudentLevelSkills table
	  # It defines all of the skills in which a student is at and the date in which it has been attained if any

	  # Connect to FTP Server and get CSV File
	  ftp = Net::FTP.new
	  ftp.connect("203.13.68.170",21)
	  ftp.login("swimdesk@ftp.cityvenuemanagement.com.au","Axs4swim")
	  ftp.chdir("/")
	  ftp.passive = true
	  # Save to file to a tmp_path
	  ftp.getbinaryfile("CodeCabin_LessonBookings.csv", "tmp_path")
	  # Open the tmp_path
	  csv_text = open("tmp_path")
	  csv = CSV.parse(csv_text, :headers=>true)

	  # Now link through the csv saving each record appropriatly, ignoring the first line
	  csv.drop(1).each do |row|
	    data = row.to_s.split(",")
	      found_people = DsLinksPeople.where(source_id: data[1].to_i).last
	      found_class = DsLinksClass.where(source_id: data[2].to_i).last

	      DsLinksStudentSkill.create(
	        source_id: data[0],
	        ds_links_people_id: found_people.present? ? found_people.id : nil,
	        ds_links_skill_id: found_class.present? ? found_class.id : nil,
	        date_booked: data[3],
	        is_makeup: data[4],
	        is_held: data[5],
	        attended: data[6],
	        cancelled: data[7],
	        is_suspended: data[8],
	        is_casual: data[9]
	      )
	  end

	   
	end

end