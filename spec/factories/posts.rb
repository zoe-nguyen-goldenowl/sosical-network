FactoryBot.define do
  factory :post do
    content{Faker::String.random(length: [0, 6])}
    user
  end
end
