class CreateDsLinksStudentSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :ds_links_student_skills do |t|
      t.string :source_id
      t.date :date_started
      t.references :ds_links_people, foreign_key: true
      t.references :ds_links_skill, foreign_key: true
      t.date :date_attained

      t.timestamps
    end
  end
end
