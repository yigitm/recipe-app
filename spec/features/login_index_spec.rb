require 'rails_helper'

RSpec.describe 'user login page', type: :feature do
  before :each do
    @user = create(:user)
    @recipe = create(:recipe, user_id: @user.id)
    visit '/users/sign_in'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'
  end

  it 'redirected to that foods page' do
    expect(page).to have_current_path(foods_path)
  end

  it 'food table table should be visible' do
    expect(page).to have_selector('table')
  end

  it 'logout button should be visible' do
    expect(page).to have_selector('p', text: 'Logout')
  end
end
