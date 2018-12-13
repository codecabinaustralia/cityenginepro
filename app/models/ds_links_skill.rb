class DsLinksSkill < ApplicationRecord
  belongs_to :ds_links_level, required: false
  has_many :ds_links_student_skills, :dependent => :destroy
end
