class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :amount, :payment_date, :status, :phone_number
  has_one :booking
  # has_one :client
  # has_one :space
end
