class Payment < ApplicationRecord
  belongs_to :booking

  validates :phone_number, presence: true
  validates :phone_number, format: { with: /\A254\d{9}\z/, message: "should start with 254 and consist of 12 digits." }
  validates :phone_number, numericality: { only_integer: true, message: "should contain only numbers." }
end
