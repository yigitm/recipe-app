FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    preparation_time { Faker::Number.within(range: 1..4) }
    cooking_time { Faker::Number.within(range: 1..4) }
    description { Faker::Food.description }
    public { Faker::Boolean.boolean }
    user_id { Faker::Number.within(range: 1..10) }
  end
end
