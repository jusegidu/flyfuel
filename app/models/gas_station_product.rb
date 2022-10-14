class GasStationProduct < ApplicationRecord
  belongs_to :gas_station
  belongs_to :product
  has_many :purchases
end
