FactoryBot.define do
  factory :quest do
    name { "test_quest" }
    introduction { Faker::Lorem.characters(number: 20) }
    price { Faker::Number.between(from: 10, to: 300).to_s }
    time { Faker::Number.between(from: 3, to: 30).to_s }
  end
end