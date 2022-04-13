require 'rails_helper'

RSpec.describe 'foods index page', type: :feature do
  before :each do
    @user = create(:user)
    @food = create(:food, user_id: @user.id)
    @food2 = create(:food, user_id: @user.id)
    @food3 = create(:food, user_id: @user.id)
    visit '/users/sign_in'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'
  end

  it 'should have the rigth path' do
    expect(page).to have_current_path(foods_path)
  end

  it 'food table table should be visible' do
    expect(page).to have_selector('table')
  end

  it 'new food button should be visible' do
    expect(page).to have_selector('a', text: 'New food')
  end

  it 'delete button should be visible' do
    expect(page).to have_selector('.btn-danger', text: 'Delete')
  end

  it 'all food items should be listed' do
    expect(all('tr').count).to eq(4)
  end
end
