class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.integer :location_id
      t.integer :city_id

      t.timestamps
    end
  end
end
