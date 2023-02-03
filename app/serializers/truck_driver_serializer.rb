# frozen_string_literal: true

# This class is a serializer for the TruckDriver model.
class TruckDriverSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at
end
