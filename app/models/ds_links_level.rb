class DsLinksLevel < ApplicationRecord
	has_many :ds_links_classes
	has_many :ds_links_skills, :dependent => :destroy
	has_many :ds_links_student_levels, :dependent => :destroy
end
