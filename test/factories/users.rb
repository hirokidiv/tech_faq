FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "name#{n}" }
    sequence(:email) { |n| "email#{n}@gmail.com" }
    password { "testtest" }
    password_confirmation { "testtest" }
  end
end
