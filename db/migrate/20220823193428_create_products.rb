# frozen_string_literal: true

# It creates a table called products with the columns kind, description, and value
class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :kind
      t.string :description
      t.string :value

      t.timestamps
    end
  end
end
