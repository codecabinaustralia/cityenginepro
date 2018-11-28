class DsLinksLessonBooking < ApplicationRecord
  belongs_to :ds_links_people
  belongs_to :ds_links_class
end
