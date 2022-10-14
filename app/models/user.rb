class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user
  has_many :purchases
  has_many :gas_stations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
