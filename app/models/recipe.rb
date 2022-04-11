class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  def ingridients
    recipe_foods.includes(:food)
  end
end
