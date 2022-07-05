FactoryBot.define do
  factory :dish do
    name { "MyString" }
    price { 1 }
    weight { 1 }
    restaurant { nil }
    category { nil }
  end
end
