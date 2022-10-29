class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :gas_station_product
  validates :amount_cents, numericality: { only_integer: true }, presence: true
  monetize :amount_cents
  register_currency :cop
  enum status: {
    pending: 0,
    completed: 1,
    rejected: 2
  }
  after_initialize :default_amount_currency
  after_initialize :calculate_amount

  private

  def default_amount_currency
    self.amount_currency = "COP"
  end

  def calculate_amount
    if self.gas_station_product_id
      self.amount = self.quantity * GasStationProduct.find(self.gas_station_product_id).price
    end
  end
end
