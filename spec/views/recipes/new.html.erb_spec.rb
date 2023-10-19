require 'rails_helper'

RSpec.describe 'foods/index', type: :feature do
  let(:user) { User.create(email: 'foo@gmail.com', name: 'foo', password: 'passsword12') }
  before(:each) do
    sign_in user
    visit new_recipe_path
  end

  it 'renders a recipe Form' do
    expect(page).to have_content('New recipe')
    expect(page).to have_content('Name')
    expect(page).to have_content('Preparation time')
    expect(page).to have_content('Cooking time')
    expect(page).to have_content('Description')
    expect(page).to have_content('Public')
  end
  it 'When I click on a Delete button, it redirects me to that recipe delete ' do
    click_on('Create Recipe')
    expect(current_path).to eq(recipes_path)
  end
end
