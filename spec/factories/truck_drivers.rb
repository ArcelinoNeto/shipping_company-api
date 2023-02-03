# frozen_string_literal: true

FactoryBot.define do
  factory :truck_driver do
    name { Faker::Name.unique.name }
  end
end
