class Client < ApplicationRecord
  has_secure_password

  has_many :spaces
  has_many :clients, through: :spaces

  has_many :bookings

  validates :username, :email, :password, presence: true
  validates :email, :username, uniqueness: true
  validates :password, { :length => { :in => 6..20 } }
  # validates :password, presence: true, length: { minimum: 8, maximum: 20 }, if: :password_digest_changed?
end
