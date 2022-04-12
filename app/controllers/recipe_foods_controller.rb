class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show edit update destroy]
  def destroy
    @recipe = @recipe_food.recipe
    @recipe_food.destroy
    redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully deleted.'
  end

  def edit; end

  def update
    @recipe = @recipe_food.recipe
    if @recipe_food.update(recipe_food_params)
      redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully edited.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    new_food = RecipeFood.new(recipe_food_params)
    if new_food.save
      redirect_to recipe_path(new_food.recipe), notice: 'Ingredient was successfully added.'
    else
      p 'something went wrong'
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @food = Food.all
    @recipe_food = Recipe.find(params[:recipe]).recipe_foods.new
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id)
  end
end
