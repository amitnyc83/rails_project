class Patient < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :appointments
  has_many :physicians, through: :appointments

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  
  has_secure_password
end
