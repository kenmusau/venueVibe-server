class SpaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :price, :status, :image, :description, :contact, :admin_id, :client_id
  # has_one :admin
  # has_one :client
end
