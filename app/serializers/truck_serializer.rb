class TruckSerializer < ActiveModel::Serializer
    attributes :id, :name, :truck_driver_id, :created_at, :updated_at
end