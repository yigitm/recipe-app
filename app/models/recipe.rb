class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  def ingridients
    recipe_foods.includes(:food)
  end

  def total_price
    total = 0
    ingridients.each do |ingredient|
      total += ingredient.quantity * ingredient.food.price
    end
    total
  end
end
