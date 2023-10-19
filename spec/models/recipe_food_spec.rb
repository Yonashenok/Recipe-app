require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:user) { User.create(email: 'example@gmail.com', name: 'foo', password: 'passsword') }
  let(:food) { Food.create(name: 'Apple', measurement_unit: 'gram', price: 10, quantity: 30, user:)}
  let(:recipe) { Recipe.create(name: 'buger', preparation_time: '1 hour', cooking_time: '30 minutes',
                  description: 'Testing testing', public: false, user:)}
    
  it 'should have valid attribute' do
    recipe_food = RecipeFood.new(recipe:, food:, quantity: 2)
    expect(recipe_food).to be_valid
  end
  it 'should have invalid attribute missing quantity' do
    recipe_food = RecipeFood.new(recipe:, food:, quantity: nil)
    expect(recipe_food).not_to be_valid
  end
  it 'should have invalid attribute missing food instance' do
    recipe_food = RecipeFood.new(recipe:, quantity: 2)
    expect(recipe_food).not_to be_valid
  end
  it 'should have invalid attribute missing recipe instance' do
    recipe_food = RecipeFood.new(food:, quantity: 2)
    expect(recipe_food).not_to be_valid
  end
end
