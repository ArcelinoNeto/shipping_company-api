# frozen_string_literal: true

# This class is responsible for serializing Truck objects into JSON.
class TruckSerializer < ActiveModel::Serializer
  attributes :id, :name, :truck_driver_id, :created_at, :updated_at
end
