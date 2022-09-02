class CreateTrucks < ActiveRecord::Migration[6.1]
  def change
    create_table :trucks do |t|
      t.string :name
      t.references :truck_driver, foreign_key: true

      t.timestamps
    end
  end
end
