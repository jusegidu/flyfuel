class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum status: {
    normal: 0,
    admin: 1
  }
  has_many :purchases
  has_many :gas_stations
  validates :first_name, :last_name, :fuel, presence: true
  validates :fuel, inclusion: { in: %w(corriente extra diesel) }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
