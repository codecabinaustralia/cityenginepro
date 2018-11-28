class DsLinksStudentSkill < ApplicationRecord
  belongs_to :ds_links_people
  belongs_to :ds_links_skill
end
