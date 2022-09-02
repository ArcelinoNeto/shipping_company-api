class CreateTruckDrivers < ActiveRecord::Migration[6.1]
  def change
    create_table :truck_drivers do |t|
      t.string :name

      t.timestamps
    end
  end
end
