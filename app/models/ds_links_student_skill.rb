class DsLinksStudentSkill < ApplicationRecord
  belongs_to :ds_links_people, required: false
  belongs_to :ds_links_skill, required: false
end
