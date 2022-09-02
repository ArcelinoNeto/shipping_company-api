FactoryBot.define do
  factory :delivery do
    origin_city { "MyString" }
    destiny_city { "MyString" }
    truck { nil }
    product { nil }
  end
end
