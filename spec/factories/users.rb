FactoryBot.define do
  factory :user do
    name                    {"田中太郎"}
    sequence(:email)        {|n| "spec#{n}@gmail.com"}
    password                {12345678}
    password_confirmation   {12345678}
    image                   {"text"}
    introduction            {"text"}
  end
end