FactoryBot.define do
  factory :member do
    nickname { 'test_user' }
    birthday { Date.new(2011, 5, 10) }
    password { 'password' }
  end
end
