class PhysicianSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :specialty, :slug

  has_many :appointments, serializer: AppointmentSerializer
  has_many :patients, serializer: PatientSerializer
end
