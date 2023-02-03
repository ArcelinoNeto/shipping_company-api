# frozen_string_literal: true

# When creating a new truck driver, the name must be present.
class TruckDriver < ApplicationRecord
  validates_presence_of :name, on: :create
end
