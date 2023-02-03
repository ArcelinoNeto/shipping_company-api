# frozen_string_literal: true

# This class is a serializer for the Product model, and it will serialize the id, kind, description,
# value, created_at, and updated_at attributes.
class ProductSerializer < ActiveModel::Serializer
  attributes :id, :kind, :description, :value, :created_at, :updated_at
end
