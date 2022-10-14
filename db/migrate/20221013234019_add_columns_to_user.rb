class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :birthday, :date, null: false
    add_column :users, :address, :string, null: false
    add_column :users, :fuel, :string, null: false
    add_column :users, :permission_level, :integer, null: false
  end
end
