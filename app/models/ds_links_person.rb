class DsLinksPerson < ApplicationRecord
  belongs_to :ds_links_location, required: false
  has_many :ds_links_lesson_bookings
  has_many :ds_links_classes
  has_many :ds_links_student_levels, :dependent => :destroy
  has_many :ds_links_student_skills, :dependent => :destroy
end
