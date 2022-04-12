require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.create!(
      name: 'Test',
      password: '123456',
      email: 'test@gmail.com',
      password_confirmation: '123456'
    )
    @recipe = @user.recipes.new(name: 'Lasagna',
                                preparation_time: 4,
                                cooking_time: 3,
                                description: 'Im a recipe')
  end

  it 'should be valid with correct parameters' do
    expect(@recipe).to be_valid
  end

  it 'name should be present' do
    @recipe.name = nil
    expect(@recipe).to_not be_valid
  end

  it 'preparation_time should be an integer' do
    @recipe.preparation_time = 5.5
    expect(@recipe).to_not be_valid
  end

  it 'preparation_time should be greater than or equal to 0' do
    @recipe.preparation_time = -1
    expect(@recipe).to_not be_valid
  end
end
