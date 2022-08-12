

FactoryBot.define do
    factory :user do
      first_name {"Paul"}
      last_name {"Kovalyk"}
      email {"hakuna@gmail.com"}
      password {"celtics"}
      owner {false}
    end
end