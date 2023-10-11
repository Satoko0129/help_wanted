FactoryBot.define do
  factory :admin do
    email { 'example@hoge.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
