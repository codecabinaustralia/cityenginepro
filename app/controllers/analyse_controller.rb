class AnalyseController < ApplicationController
  require 'date'
  require 'time'

  def days_from_level_achieved

    #Find all student levels
    student_levels = DsLinksStudentLevel.all.order(date_started: :desc).group_by(&:ds_links_people_id)
    student_levels = student_levels.group_by(&:ds_links_people_id)
    # Loop through them and count the days between last attained
    student_levels.each do |s|
      if s.date_attained.present?
        date_achieved = Date.parse("#{s.date_attained}")
        date_today = Date.today
        result = (date_today - date_achieved).to_i
      else # if there is no attained date count from start date
        date_achieved = Date.parse("#{s.date_started}")
        date_today = Date.today
        result = (date_today - date_achieved).to_i
      end

      # Save result somewhere

    end

  end

  def days_between_level_achievements
  end

  def attendence_from_skill_achieved
  end

  def attendence_between_skill_achievements
  end

  def attendence_from_level_achieved
  end

  def attendence_between_level_achievements
  end

  def age_when_skill_achieved
  end

  def age_when_level_achieved
  end

  def people_site_location
  end

  def people_determine_age
  end

  def identify_teachers
  end

  def average_lessons_attended_weekly
  end

  def identify_current_student_level
  end
end


#rails g migration AddAnalystFieldsToDsLinksStudentLevel days_from_level_achieved:integer