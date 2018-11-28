class CreateDsLinksSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :ds_links_skills do |t|
      t.string :source_id
      t.references :ds_links_level, foreign_key: true
      t.string :skill
      t.integer :priority
      t.string :description
      t.boolean :active

      t.timestamps
    end
  end
end
