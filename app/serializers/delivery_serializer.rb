class DeliverySerializer < ActiveModel::Serializer
  belongs_to :truck
  belongs_to :product

  attributes :id, :origin_city, :destiny_city, :truck_id, :product_id, :created_at, :updated_at
end