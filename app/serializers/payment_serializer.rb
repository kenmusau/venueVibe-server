class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :amount, :payment_date, :status
  has_one :booking
end
