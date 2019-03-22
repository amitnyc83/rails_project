class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :date, :time

  belongs_to :physician, serializer: AppointmentPhysicianSerializer
  belongs_to :patient, serializer: AppointmentPatientSerializer

end
