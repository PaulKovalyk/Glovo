FactoryBot.define do
  factory :line_item do
    price { "9.99" }
    quantity { 1 }
    dishes { nil }
    carts { nil }
    orders { nil }
  end
end
