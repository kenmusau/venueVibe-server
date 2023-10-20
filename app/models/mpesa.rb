class Mpesa < ApplicationRecord
  # Associations
  belongs_to :access_token
  belongs_to :booking
end
