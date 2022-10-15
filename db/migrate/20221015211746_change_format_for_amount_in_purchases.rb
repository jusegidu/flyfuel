class ChangeFormatForAmountInPurchases < ActiveRecord::Migration[7.0]
  def change
    remove_column :purchases, :amount
    add_monetize :purchases, :amount
  end
end
