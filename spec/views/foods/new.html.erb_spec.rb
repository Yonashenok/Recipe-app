require 'rails_helper'

RSpec.describe 'foods/index', type: :feature do
  let(:user) { User.create(email: 'foo@gmail.com', name: 'foo', password: 'passsword12') }
  before(:each) do
    sign_in user
    visit new_food_path
  end

  it 'renders a form for new food' do
    expect(page).to have_content('New food')
    expect(page).to have_content('Measurement unit')
    expect(page).to have_content('Price')
    expect(page).to have_content('Quantity')
  end
  it "When I click on a View button, it redirects me to that food show page" do
    find(".btn-info", match: :first).click
    expect(current_path).to eq(foods_path)
  end
end
