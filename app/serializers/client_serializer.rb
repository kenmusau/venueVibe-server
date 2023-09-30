class ClientSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :email, :password, :profile_picture
end
