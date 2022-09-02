class Product < ApplicationRecord
    validates_presence_of :kind, on: :create, message: "can't be blank"
    validates_presence_of :value, on: :create, message: "can't be blank"
end
