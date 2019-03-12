class PatientPhysicianSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :specialty
end
