class SpaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :price, :status, :image, :description, :contact
  has_one :admin
  has_one :client
end
