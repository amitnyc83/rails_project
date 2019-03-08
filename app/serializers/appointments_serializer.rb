class AppointmentsSerializer < ActiveModel::Serializer
  attributes :id, :date, :time

  belongs_to :physician, serializer: PhysicianAppointmentSerializer
  belongs_to :patient, serializer: PatientAppointmentSerializer

end
