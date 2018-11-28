class DsLinksStudentLevel < ApplicationRecord
  belongs_to :ds_links_people
  belongs_to :ds_links_level
end
