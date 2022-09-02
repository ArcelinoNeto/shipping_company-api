class ProductSerializer < ActiveModel::Serializer
    attributes :id, :kind, :description, :value, :created_at, :updated_at
end