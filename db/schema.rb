# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_28_073307) do

  create_table "ds_links_classes", force: :cascade do |t|
    t.string "source_id"
    t.date "start_date"
    t.date "end_date"
    t.string "lesson_day"
    t.datetime "lesson_start"
    t.datetime "lesson_end"
    t.integer "ds_links_people_id"
    t.integer "max_students"
    t.integer "ds_links_location_id"
    t.integer "ds_links_level_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ds_links_person_id"
    t.index ["ds_links_level_id"], name: "index_ds_links_classes_on_ds_links_level_id"
    t.index ["ds_links_location_id"], name: "index_ds_links_classes_on_ds_links_location_id"
    t.index ["ds_links_people_id"], name: "index_ds_links_classes_on_ds_links_people_id"
  end

  create_table "ds_links_lesson_bookings", force: :cascade do |t|
    t.string "source_id"
    t.integer "ds_links_people_id"
    t.integer "ds_links_class_id"
    t.date "date_booked"
    t.boolean "is_makeup"
    t.boolean "is_held"
    t.boolean "attended"
    t.date "cancelled"
    t.boolean "is_suspended"
    t.boolean "is_casual"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ds_links_class_id"], name: "index_ds_links_lesson_bookings_on_ds_links_class_id"
    t.index ["ds_links_people_id"], name: "index_ds_links_lesson_bookings_on_ds_links_people_id"
  end

  create_table "ds_links_levels", force: :cascade do |t|
    t.string "source_id"
    t.string "description"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ds_links_locations", force: :cascade do |t|
    t.string "source_id"
    t.string "location_name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ds_links_people", force: :cascade do |t|
    t.string "source_id"
    t.string "surname"
    t.string "given_name"
    t.string "title"
    t.date "date_of_birth"
    t.string "gender"
    t.string "address"
    t.string "suburb"
    t.string "postcode"
    t.string "home_phone"
    t.string "work_phone"
    t.string "mobile_phone"
    t.string "email"
    t.string "email_secondary"
    t.integer "ds_links_location_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ds_links_location_id"], name: "index_ds_links_people_on_ds_links_location_id"
  end

  create_table "ds_links_skills", force: :cascade do |t|
    t.string "source_id"
    t.integer "ds_links_level_id"
    t.string "skill"
    t.integer "priority"
    t.string "description"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ds_links_level_id"], name: "index_ds_links_skills_on_ds_links_level_id"
  end

  create_table "ds_links_student_levels", force: :cascade do |t|
    t.string "source_id"
    t.date "date_started"
    t.integer "ds_links_people_id"
    t.integer "ds_links_level_id"
    t.date "date_attained"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ds_links_level_id"], name: "index_ds_links_student_levels_on_ds_links_level_id"
    t.index ["ds_links_people_id"], name: "index_ds_links_student_levels_on_ds_links_people_id"
  end

  create_table "ds_links_student_skills", force: :cascade do |t|
    t.string "source_id"
    t.date "date_started"
    t.integer "ds_links_people_id"
    t.integer "ds_links_skill_id"
    t.date "date_attained"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ds_links_people_id"], name: "index_ds_links_student_skills_on_ds_links_people_id"
    t.index ["ds_links_skill_id"], name: "index_ds_links_student_skills_on_ds_links_skill_id"
  end

end
