class Physician < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_many :appointments
  has_many :patients, through: :appointments


  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  has_secure_password

  scope :type_of_Specialty, -> {where("specialty = ?", "Surgeon")}



end
