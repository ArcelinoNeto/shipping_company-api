# frozen_string_literal: true

# It's a Delivery class that belongs to a Truck and a Product, and it validates the presence of
# origin_city and destiny_city on create
class Delivery < ApplicationRecord
  belongs_to :truck
  belongs_to :product

  validates_presence_of :origin_city, on: :create
  validates_presence_of :destiny_city, on: :create

  accepts_nested_attributes_for :truck
  accepts_nested_attributes_for :product
end
