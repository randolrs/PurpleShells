class AddTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_teacher, :boolean, :default => false
    add_column :users, :name, :string
    add_column :users, :source_id, :integer
    add_column :users, :has_active_payment_method, :boolean, :default => false
  end
end
