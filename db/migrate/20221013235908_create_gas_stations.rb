class CreateGasStations < ActiveRecord::Migration[7.0]
  def change
    create_table :gas_stations do |t|
      t.string :name
      t.string :address
      t.string :latitud
      t.string :longitud
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
