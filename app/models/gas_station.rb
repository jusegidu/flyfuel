class GasStation < ApplicationRecord
  belongs_to :user
  has_many :gas_station_products
  validates :name, :address, :latitud, :longitud, presence: true
end
