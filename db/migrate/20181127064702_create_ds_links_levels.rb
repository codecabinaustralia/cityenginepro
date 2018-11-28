class CreateDsLinksLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :ds_links_levels do |t|
      t.string :source_id
      t.string :description
      t.string :color

      t.timestamps
    end
  end
end
