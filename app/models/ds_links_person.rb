class DsLinksPerson < ApplicationRecord
  belongs_to :ds_links_location, required: nil
end
