class ChangeTypeColumnsForStringToPayment < ActiveRecord::Migration[7.0]
  def change
    remove_column :payments, :card_number
    remove_column :payments, :exp_date
    remove_column :payments, :cvv
    add_column :payments, :card_number, :string
    add_column :payments, :exp_date, :string
    add_column :payments, :cvv, :string
  end
end
