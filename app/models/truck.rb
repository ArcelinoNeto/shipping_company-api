# frozen_string_literal: true

# A truck belongs to a truck driver and has many deliveries
class Truck < ApplicationRecord
  belongs_to :truck_driver
  has_many :deliveries

  validates_presence_of :name, on: :create
end
