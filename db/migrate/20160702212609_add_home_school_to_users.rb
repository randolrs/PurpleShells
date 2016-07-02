class AddHomeSchoolToUsers < ActiveRecord::Migration
  def change
    add_column :users, :default_location, :integer, :default => 1
  end
end
