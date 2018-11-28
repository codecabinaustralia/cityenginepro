class CreateDsLinksLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :ds_links_locations do |t|
      t.string :source_id
      t.string :location_name
      t.string :description

      t.timestamps
    end
  end
end
