# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    kind { Faker::Commerce.material }
    description { Faker::Commerce.product_name }
    value { Faker::Commerce.price(range: 0..10.0, as_string: true) }
  end
end
