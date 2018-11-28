class AddPersonToDsLinksClass < ActiveRecord::Migration[5.2]
  def change
    add_column :ds_links_classes, :ds_links_person_id, :integer
  end
end
