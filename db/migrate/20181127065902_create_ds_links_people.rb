class CreateDsLinksPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :ds_links_people do |t|
      t.string :source_id
      t.string :surname
      t.string :given_name
      t.string :title
      t.date :date_of_birth
      t.string :gender
      t.string :address
      t.string :suburb
      t.string :postcode
      t.string :home_phone
      t.string :work_phone
      t.string :mobile_phone
      t.string :email
      t.string :email_secondary
      t.references :ds_links_location, foreign_key: true
      t.string :state

      t.timestamps
    end
  end
end
