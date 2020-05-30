FactoryBot.define do
  factory :transaction do
    name      { "string" }
    price     { 1000 }
    association :user
    association :product
  end
end
