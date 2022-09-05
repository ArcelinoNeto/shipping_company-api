class TruckDriver < ApplicationRecord
    validates_presence_of :name, on: :create
end
