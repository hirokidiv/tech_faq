FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "title#{n}" }
    sequence(:solution) { |n| "solution#{n}" }
    factor { "test" }
    knowledge { "test" }
  end
end
