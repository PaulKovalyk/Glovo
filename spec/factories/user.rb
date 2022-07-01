require 'factory_bot'
require 'faker'

FactoryBot.define do
    factory :user do
      first_name {"Paul"}
      last_name {"Kovalyk"}
      email {Faker::Internet.email}
      password {Faker::Internet.password}
    end
end