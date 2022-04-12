class ShoppingController < ApplicationController
  include ShoppingHelper
  before_action :authenticate_user!
  def index
    @recipes = current_user.recipes
    @foods = food_list(current_user)
    @total_price = total_price(@recipes)
  end
end
