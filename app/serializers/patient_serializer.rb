class PatientSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :age, :date_of_birth, :slug

  has_many :physicians, serializer: PatientPhysicianSerializer
end
