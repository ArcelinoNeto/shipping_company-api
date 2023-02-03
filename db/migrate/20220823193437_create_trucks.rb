# frozen_string_literal: true

# This class creates a table called trucks with a name and a foreign key to the truck_drivers table
class CreateTrucks < ActiveRecord::Migration[6.1]
  def change
    create_table :trucks do |t|
      t.string :name
      t.references :truck_driver, foreign_key: true

      t.timestamps
    end
  end
end
