class Physician < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :Appointments


  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  has_secure_password
end
