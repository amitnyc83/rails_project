class AppointmentsSerializer < ActiveModel::Serializer
  attributes :id, :physician_id, :patient_id, :date, :time
  belongs_to :physician
  belongs_to :patient
end
