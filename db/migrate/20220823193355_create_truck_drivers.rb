# frozen_string_literal: true

# This class creates a table called truck_drivers with a string column called name and two timestamp
# columns called created_at and updated_at.
class CreateTruckDrivers < ActiveRecord::Migration[6.1]
  def change
    create_table :truck_drivers do |t|
      t.string :name

      t.timestamps
    end
  end
end
