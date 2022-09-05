FactoryBot.define do
  factory :truck do
    name { Faker::Name.first_name }
    association(:truck_driver)
  end
end
