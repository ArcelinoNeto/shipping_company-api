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
