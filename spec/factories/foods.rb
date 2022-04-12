FactoryBot.define do
  factory :food do
    name { Faker::Movies::StarWars.character }
    measurement_unit { Faker::Food.metric_measurement }
    price { Faker::Number.within(range: 20..200) }
    user_id { Faker::Number.within(range: 1..5) }
  end
end
