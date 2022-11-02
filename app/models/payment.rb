class Payment < ApplicationRecord
  validates :cvv, numericality: { only_integer: true }
  validates :cvv, length: { is: 3 }
  validates :exp_date, numericality: { only_integer: true }
  validates :exp_date, length: { is: 4 }
  validates :card_number, numericality: { only_integer: true }
  validates :card_number, length: { is: 16 }
end
