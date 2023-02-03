# frozen_string_literal: true

FactoryBot.define do
  factory :delivery do
    origin_city { Faker::Address.city }
    destiny_city { Faker::Address.city }
    association(:truck)
    association(:product)
  end
end
