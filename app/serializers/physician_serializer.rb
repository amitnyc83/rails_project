class PhysicianSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :specialty
  has_many :appointments
end
