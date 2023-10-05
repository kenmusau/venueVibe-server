class Booking < ApplicationRecord
  belongs_to :spaces
  belongs_to :client
end
