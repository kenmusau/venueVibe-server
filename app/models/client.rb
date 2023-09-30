class Client < ApplicationRecord
  has_secure_password

  has_many :spaces
  has_many :clients, through: :spaces
end
