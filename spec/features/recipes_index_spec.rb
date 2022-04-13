require 'rails_helper'

RSpec.describe 'Recipe Index Page', type: :features do
  describe 'Recipe model' do
    before :each do
      @user = create(:user)
      @recipe = create(:recipe, user_id: @user.id)
      visit '/users/sign_in'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_on 'Log in'
      visit '/recipes'
    end

    it 'I can see the first recipe name.' do
      expect(page).to have_content(@recipe.name)
    end

    it 'I can see the first recipe description' do
      expect(page).to have_content(@recipe.description)
    end

    it 'I can see the remove button' do
      expect(page).to have_content('Delete')
    end

    it 'When I click on recipe, it redirects me to recipe details page.' do
      find('a', text: @recipe.name).click
      expect(page).to have_content(@recipe.name)
      expect(current_path).to eq("/recipes/#{@recipe.id}")
    end

    it 'When I click on remove button, it deletes the recipe.' do
      find('button', text: 'Delete').click
      expect(page).to_not have_content(@recipe.name)
      expect(page).to_not have_content(@recipe.description)
      expect(current_path).to eq('/recipes')
    end
  end
end
