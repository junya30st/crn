FactoryBot.define do
  factory :blog do
    title { "MyString" }
    content { "MyText" }
    image { "MyText" }
    association :shop
  end
end
