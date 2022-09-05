class Truck < ApplicationRecord
  belongs_to :truck_driver
  has_many :deliveries

  validates_presence_of :name, on: :create
end
