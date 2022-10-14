class Company < ApplicationRecord
  has_many :users
  validates :name, :address, :nit, presence: true
  validates :nit, numericality: { only_integer: true }
end
