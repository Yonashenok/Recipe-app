require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create(email: 'example@gmail.com', name: 'foo', password: 'passsword') }
  let(:recipe) do
    Recipe.create(name: 'buger', preparation_time: '1 hour', cooking_time: '30 minutes',
                  description: 'Testing testing', public: false, user:)
  end

  it 'should have valid attribute' do
    expect(recipe).to be_valid
  end
  it 'should have invalid attribute missing name' do
    recipe.name = nil
    expect(recipe).not_to be_valid
  end
  it 'should have invalid attribute missing description' do
    recipe.description = nil
    expect(recipe).not_to be_valid
  end
  it 'should have invalid attribute missing prepartion_time' do
    recipe.preparation_time = nil
    expect(recipe).not_to be_valid
  end
  it 'should have invalid attribute missing cooking_time' do
    recipe.cooking_time = nil
    expect(recipe).not_to be_valid
  end
end
