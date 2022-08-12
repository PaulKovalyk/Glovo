FactoryBot.define do
    factory :line_item do
      dish {create(:dish)}
     cart {create(:cart)}
     quantity{ }
     order { create(:order)}
    end
  end