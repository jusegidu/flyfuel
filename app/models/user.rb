class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user
  has_many :purchases
  has_many :gas_stations
  validates :first_name, :last_name, :fuel, presence: true
  validates :size, inclusion: { in: %w(corriente extra diesel) }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
