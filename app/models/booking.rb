class Booking < ApplicationRecord
  belongs_to :space
  belongs_to :client
  has_many :payments
end
