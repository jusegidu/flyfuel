class GasStation < ApplicationRecord
  belongs_to :user
  has_many :gas_station_products, dependent: :destroy
  validates :name, :address, presence: true
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
