class AppointmentsSerializer < ActiveModel::Serializer
  attributes :id, :date, :time

  belongs_to :physician 
  belongs_to :patient

end
