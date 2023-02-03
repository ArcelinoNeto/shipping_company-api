# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

# rubocop:disable Metrics/BlockLength
ActiveRecord::Schema.define(version: 20_220_823_193_503) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'deliveries', force: :cascade do |t|
    t.string 'origin_city'
    t.string 'destiny_city'
    t.bigint 'truck_id'
    t.bigint 'product_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['product_id'], name: 'index_deliveries_on_product_id'
    t.index ['truck_id'], name: 'index_deliveries_on_truck_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'kind'
    t.string 'description'
    t.string 'value'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'truck_drivers', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'trucks', force: :cascade do |t|
    t.string 'name'
    t.bigint 'truck_driver_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['truck_driver_id'], name: 'index_trucks_on_truck_driver_id'
  end

  add_foreign_key 'deliveries', 'products'
  add_foreign_key 'deliveries', 'trucks'
  add_foreign_key 'trucks', 'truck_drivers'
end
# rubocop:enable Metrics/BlockLength
