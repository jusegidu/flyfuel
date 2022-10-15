class ChangeFormatForPriceInGasStationProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :gas_station_products, :price
    add_monetize :gas_station_products, :price
  end
end
