class BookingSerializer < ActiveModel::Serializer
  attributes :id, :status, :check_in, :check_out
  has_one :spaces
  has_one :client
end
