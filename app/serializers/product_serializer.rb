class ProductSerializer < ActiveModel::Serializer
    attributes :id, :kynd, :description, :value, :created_at, :updated_at
end