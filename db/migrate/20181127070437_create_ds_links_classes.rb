class CreateDsLinksClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :ds_links_classes do |t|
      t.string :source_id
      t.date :start_date
      t.date :end_date
      t.string :lesson_day
      t.datetime :lesson_start
      t.datetime :lesson_end
      t.references :ds_links_people, foreign_key: true
      t.integer :max_students
      t.references :ds_links_location, foreign_key: true
      t.references :ds_links_level, foreign_key: true

      t.timestamps
    end
  end
end
