class PatientAppointmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :date_of_birth, :slug
  has_many :appointments
end
