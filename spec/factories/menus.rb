FactoryBot.define do
  factory :menu do
    name            {"string"}
    price           {"1000"}
    introduction    {"text"}
    association :shop
  end
end
