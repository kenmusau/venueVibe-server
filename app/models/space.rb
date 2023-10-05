class Space < ApplicationRecord
  belongs_to :admin
  belongs_to :client

  has_many :bookings
end
