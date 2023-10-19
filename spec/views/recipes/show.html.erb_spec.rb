require 'rails_helper'

RSpec.describe 'foods/index', type: :feature do
  let(:user) { User.create(email: 'foo@gmail.com', name: 'foo', password: 'passsword12') }
  let!(:recipe) do
    Recipe.create(name: 'buger', preparation_time: 2, cooking_time: 2,
                  description: 'Testing testing', public: false, user:)
  end
  before(:each) do
    sign_in user
    visit recipe_path(recipe)
  end

  it 'renders a list of foods' do
    expect(page).to have_content('buger')
    expect(page).to have_content('Preparation time: 2 hours')
    expect(page).to have_content('Cooking time: 2 hours')
    expect(page).to have_content('Private')
  end
  it 'When I click on a button, it toggle between public an private' do
    click_on('Click to Toggle')
    expect(current_path).to eq(recipe_path(recipe))
  end
  it 'When I click on a button, it redirects me to the new page recipe  ' do
    click_on('Add Ingredient')
    expect(current_path).to eq(new_recipe_food_path)
  end
  it 'When I click on a button, it redirects me to the shopping list page ' do
    click_on('Generate Shopping List')
    expect(current_path).to eq(general_shoppings_path)
  end
  it 'When I click on a button, it redirects me to the recipes page  ' do
    click_on('Back to recipes')
    expect(current_path).to eq(recipes_path)
  end
end
