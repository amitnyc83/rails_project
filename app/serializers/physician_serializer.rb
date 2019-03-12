class PhysicianSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :specialty, :slug

  has_many :appointments, serializer: AppointmentsSerializer
  has_many :patients, serializer: PatientsSerializer
end
