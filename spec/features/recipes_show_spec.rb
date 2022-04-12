require 'rails_helper'

RSpec.describe 'Recipe Index Page', type: :features do
  describe 'Recipe model' do
    before :each do
      @user = create(:user)
      @recipe = create(:recipe, user_id: @user.id)
      @food = create(:food, user_id: @user.id)
      @recipe_food = create(:recipe_food, recipe_id: @recipe.id, food_id: @food.id)
      visit '/users/sign_in'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_on 'Log in'
      visit "/recipes/#{@recipe.id}"
    end

    it 'I can see the first recipe name.' do
      expect(page).to have_content(@recipe.name)
    end

    it 'I can see the add Public button' do
      expect(page).to have_content('Public')
    end

    it 'I can see the Cooking time' do
      expect(page).to have_content('Cooking time')
    end
  end
end
