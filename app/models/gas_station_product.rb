class GasStationProduct < ApplicationRecord
  belongs_to :gas_station
  belongs_to :product
  has_many :purchases, dependent: :destroy
  validates :price_cents, presence: true
  monetize :price_cents
  register_currency :cop
  after_initialize :default_price_currency

  private

  def default_price_currency
    self.price_currency = "COP"
    p "deberían ser pesos"
  end
end
