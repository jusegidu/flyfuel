class GasStation < ApplicationRecord
  belongs_to :user
  has_many :gas_station_products
end
