class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :gas_station_product
end
