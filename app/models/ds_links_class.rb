class DsLinksClass < ApplicationRecord
  belongs_to :ds_links_person, required: false
  belongs_to :ds_links_location, required: false
  belongs_to :ds_links_level, required: false
  has_many :ds_links_lesson_bookings, :dependent => :destroy
end
