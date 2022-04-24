FactoryBot.define do
  factory :user do
    id { Faker::Number}
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    date_of_birth {Faker::Date.in_date_period(year: 2018, month: 2)}
    gender {Faker::Number.within(range: 1..2)}
    phone { Faker::Number.number(digits: 10) }
  end
end