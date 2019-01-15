class Physician < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments


  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  has_secure_password
end
