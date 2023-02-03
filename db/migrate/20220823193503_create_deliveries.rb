# frozen_string_literal: true

# It creates a table called deliveries, with the columns origin_city, destiny_city, truck_id,
# product_id, created_at, and updated_at
class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.string :origin_city
      t.string :destiny_city
      t.references :truck, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
