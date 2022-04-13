# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'


User.destroy_all

(1..5).each do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!
end

(1..20).each do
  Recipe.create!(
    name: Faker::Food.dish,
    preparation_time: rand(1..5),
    cooking_time: rand(1..5),
    description: Faker::Food.description,
    user_id: rand(1..5)
  )
end

(1..30).each do
  Food.create!(
    name: Faker::Food.ingredient,
    measurement_unit: Faker::Food.metric_measurement,
    price: rand(20..100) ,
    user_id: rand(1..5)
    )
end

(1..50).each do
  RecipeFood.create!(
    quantity: rand(1..5),
    recipe_id: rand(1..20),
    food_id: rand(1..30)
    )
end

