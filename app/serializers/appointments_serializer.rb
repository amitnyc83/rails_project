class AppointmentsSerializer < ActiveModel::Serializer
  attributes :id, :date, :time
  belongs_to :physician, serializer: AppointmentsPatientSerializer
  belongs_to :patient, serializer: AppointmentsPhysicianSerializer 
end
