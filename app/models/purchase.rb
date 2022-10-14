class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :gas_station_product
  validates :price, :amount, numericality: { only_integer: true }, presence: true

end
