class DsLinksStudentLevel < ApplicationRecord
  belongs_to :ds_links_people, required: false
  belongs_to :ds_links_level, required: false
end
