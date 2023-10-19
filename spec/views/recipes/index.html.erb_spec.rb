require 'rails_helper'

RSpec.describe 'foods/index', type: :feature do
  let(:user) { User.create(email: 'foo@gmail.com', name: 'foo', password: 'passsword12') }
  let!(:recipe) { Recipe.create(name: 'buger', preparation_time: '1 hour', cooking_time: '30 minutes',
    description: 'Testing testing', public: false, user:)}
  before(:each) do
    sign_in user
    visit recipes_path
  end

  it 'renders a list of foods' do
    expect(page).to have_content('buger', count: 2)
    expect(page).to have_content('Testing testing')
  end
  it "When I click on a View button, it redirects me to that recope show page" do
    find(".btn-outline-info", match: :first).click
    expect(current_path).to eq(recipe_path(recipe))
  end
  it "When I click on a Delete button, it redirects me to that recipe delete " do
    find(".btn-outline-danger", match: :first).click
    expect(current_path).to eq(recipes_path)
  end
end
