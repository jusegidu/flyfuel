class ChangeFormatForCoordenatesToGasStations < ActiveRecord::Migration[7.0]
  def change
    remove_column :gas_stations, :latitud
    remove_column :gas_stations, :longitud
    add_column :gas_stations, :latitude, :float
    add_column :gas_stations, :longitude, :float
  end
end
