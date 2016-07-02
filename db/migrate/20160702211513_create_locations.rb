class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address_street
      t.string :address_city
      t.string :address_state_or_province
      t.string :address_postal_code
      t.string :country
      t.integer :student_capacity

      t.timestamps
    end
  end
end
