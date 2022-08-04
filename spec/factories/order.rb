FactoryBot.define do
    factory :order do
      name { 'Vitalino' }
      address { 'Skorunu 1' }
      email { 'vital1no@gmail.com' }
      pay_type { 'cash' }
    end
  end