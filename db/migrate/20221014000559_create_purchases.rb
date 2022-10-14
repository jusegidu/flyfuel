class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.integer :amount
      t.integer :quantity
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :gas_station_product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
