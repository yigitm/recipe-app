require 'rails_helper'

RSpec.describe 'user sign up page', type: :feature do
  before :each do
    visit '/users/sign_up'
    fill_in 'Name', with: 'John Doe'
    fill_in 'Email', with: 'john@mail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
  end

  it 'sign up message should appear' do
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  it 'logout button should be visible' do
    expect(page).to have_selector('p', text: 'Logout')
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
