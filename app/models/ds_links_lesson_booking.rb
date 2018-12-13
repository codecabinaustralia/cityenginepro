class DsLinksLessonBooking < ApplicationRecord
  belongs_to :ds_links_person, required: false
  belongs_to :ds_links_class, required: false
end
