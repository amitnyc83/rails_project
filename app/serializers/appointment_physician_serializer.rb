class AppointmentPhysicianSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug
  has_many :appointments
end
