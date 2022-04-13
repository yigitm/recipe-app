class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true
  validates :cooking_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :preparation_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

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
