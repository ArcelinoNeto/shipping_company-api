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
