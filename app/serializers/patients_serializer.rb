class PatientsSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :age, :date_of_birth
  has_many :appointments
end
