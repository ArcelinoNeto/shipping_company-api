class Delivery < ApplicationRecord
  belongs_to :truck
  belongs_to :product

  validates_presence_of :origin_city, on: :create, message: "can't be blank"
  validates_presence_of :destiny_city, on: :create, message: "can't be blank"
  
  accepts_nested_attributes_for :truck
  accepts_nested_attributes_for :product

end
