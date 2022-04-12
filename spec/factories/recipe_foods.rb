FactoryBot.define do
  factory :recipe_food do
    quantity { Faker::Number.within(range: 1..20) }
    recipe_id { Faker::Number.within(range: 1..10) }
    food_id { Faker::Number.within(range: 1..10) }
  end
end
