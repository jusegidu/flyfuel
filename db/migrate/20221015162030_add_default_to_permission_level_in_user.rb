class AddDefaultToPermissionLevelInUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :permission_level, :integer, default: 0
  end
end
