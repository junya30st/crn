FactoryBot.define do
  factory :product do
    name                    {"居酒屋"}
    introduction            {"こんにちは"}
    price                   { 1000 }
    limit                   { 1 }
    image                   {"text"}
    association :shop
  end
end
