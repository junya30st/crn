FactoryBot.define do
  factory :card do
    customer_id     {"string"}
    card_id         {"string"}
    association :user
  end
end
