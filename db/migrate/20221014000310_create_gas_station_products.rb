class CreateGasStationProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :gas_station_products do |t|
      t.integer :price
      t.references :gas_station, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
