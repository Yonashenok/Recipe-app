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
  before(:each) do
    sign_in user
    visit food_path(food1)
  end

  it 'renders a list of foods' do
    expect(page).to have_content('gram', count: 1)
    expect(page).to have_content('Apple', count: 1)
  end
  it "When I click on a View button, it redirects me to that food show page" do
    click_on('Back to foods')
    expect(current_path).to eq(foods_path)
  end
end
