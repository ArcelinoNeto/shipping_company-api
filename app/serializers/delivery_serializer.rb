# frozen_string_literal: true

# It's a serializer for the Delivery model that includes the truck and product associations
class DeliverySerializer < ActiveModel::Serializer
  belongs_to :truck
  belongs_to :product

  attributes :id, :origin_city, :destiny_city, :truck_id, :product_id, :created_at, :updated_at
end
