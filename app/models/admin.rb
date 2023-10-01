class Admin < ApplicationRecord
  has_secure_password

  has_many :spaces
  has_many :clients, through: :spaces

  validates :username, :first_name, :last_name, :email, :password, :profile_picture, presence: true
  validates :email, :username, uniqueness: true
  validates :password, { :length => { :in => 6..20 } }
end
