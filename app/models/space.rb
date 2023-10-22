class Space < ApplicationRecord
  belongs_to :admin

  has_many :clients
  has_many :bookings
end
