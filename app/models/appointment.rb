class Appointment < ApplicationRecord


  belongs_to :physician
  belongs_to :patient

  validates :physician_id, presence: true
  validates :patient_id, presence: true
  validates :date, presence: true
  validates :time, presence: true


  scope :upcoming, -> {where("date >= ? AND date <= ?", Date.today, Date.today+2.week)}
end
