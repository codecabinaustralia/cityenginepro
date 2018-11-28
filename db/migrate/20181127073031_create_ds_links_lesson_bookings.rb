class CreateDsLinksLessonBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :ds_links_lesson_bookings do |t|
      t.string :source_id
      t.references :ds_links_people, foreign_key: true
      t.references :ds_links_class, foreign_key: true
      t.date :date_booked
      t.boolean :is_makeup
      t.boolean :is_held
      t.boolean :attended
      t.date :cancelled
      t.boolean :is_suspended
      t.boolean :is_casual

      t.timestamps
    end
  end
end
