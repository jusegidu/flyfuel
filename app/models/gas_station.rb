class GasStation < ApplicationRecord
  belongs_to :user
  has_many :gas_station_products, dependent: :destroy
  validates :name, :address, :latitude, :longitude, presence: true
  has_one_attached :photo
end
