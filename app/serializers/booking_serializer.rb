class BookingSerializer < ActiveModel::Serializer
  attributes :id, :status, :check_in, :check_out, :amount
  has_one :space
  has_one :client
end
