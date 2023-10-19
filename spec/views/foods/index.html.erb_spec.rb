require 'rails_helper'

RSpec.describe 'foods/index', type: :feature do
  let(:user) { User.create(email: 'foo@gmail.com', name: 'foo', password: 'passsword12') }
  let!(:food1) { Food.create(
    name: 'Apple',
    measurement_unit: 'gram',
    price: 2,
    quantity: 3,
    user: 
  ) } 
  let!(:food2) { Food.create(
    name: 'Apple',
    measurement_unit: 'gram',
    price: 2,
    quantity: 3, 
    user:
  ) } 
  before(:each) do
    sign_in user
    visit foods_path
  end

  it 'renders a list of foods' do
    expect(page).to have_content('gram', count: 2)
    expect(page).to have_content('Apple', count: 2)
  end
  it "When I click on a View button, it redirects me to that food show page" do
    find(".btn-outline-info", match: :first).click
    expect(current_path).to eq(food_path(food1))
  end
  it "When I click on a Delete button, it redirects me to that food delete " do
    find(".btn-outline-danger", match: :first).click
    expect(current_path).to eq(foods_path)
  end
end
