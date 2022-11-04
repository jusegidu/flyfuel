class Payment < ApplicationRecord
  validates :cvv, numericality: { only_integer: true }
  # validates :cvv, format: { with: /\d/, message: "only allows numbers" }
  validates :cvv, length: { is: 3 }
  validates :exp_date, numericality: { only_integer: true }
  # validates :exp_date, format: { with: /\d/, message: "only allows numbers" }
  validates :exp_date, length: { is: 4 }
  validates :card_number, numericality: { only_integer: true }
  #validates :card_number, format: { with: /\d/, message: "only allows numbers" }
  validates :card_number, length: { is: 16 }
end
