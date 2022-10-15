class ChangeNullConditioninPermissionLeveltoUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :permission_level, :integer, default: 0, null: true
  end
end
