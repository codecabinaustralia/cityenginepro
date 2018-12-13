class DsLinksLocation < ApplicationRecord
	has_many :ds_links_classes, :dependent => :destroy
	has_many :ds_links_people, :dependent => :destroy
end
