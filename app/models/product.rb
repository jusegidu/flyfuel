class Product < ApplicationRecord
  has_many :gas_station_products
  validates :name, presence: true
end
