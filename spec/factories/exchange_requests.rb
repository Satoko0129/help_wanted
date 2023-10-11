FactoryBot.define do
  factory :exchange_quest do
    request_amount { Faker::Number.between(from: 500, to: 1000).to_s }
  end
end