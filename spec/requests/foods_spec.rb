require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  let(:user) { User.create(email: 'foo@gmail.com', name: 'foo', password: 'passsword12') }
  let(:food) do
    Food.create(name: 'Apple', measurement_unit: 'gram', price: 10, quantity: 30, user:)
  end
  before(:each) do
    sign_in user
    get foods_path
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end
  describe 'GET /show' do
    it 'renders a successful response' do
      get food_url(food)
      expect(response).to be_successful
    end
  end
  describe 'GET /new' do
    it 'renders a successful response' do
      get new_food_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Food' do
        expect do
          post foods_url, params: { food: {name: 'Apple', measurement_unit: 'gram', price: 10 , quantity: 30}}
        end.to change(Food, :count).by(1)
      end
    end
    context 'with invalid parameters' do
      it 'does not create a new Food' do
        expect do
          post foods_url, params: { food: {name: nil , measurement_unit: nil, price: 10 , quantity: 30}  }
        end.to change(Food, :count).by(0)
      end
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post foods_url, params: { food: {name: nil , measurement_unit: nil, price: 10 , quantity: 30} }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
  describe 'DELETE /destroy' do
    it 'destroys the requested food' do
      expect do
        delete food_url(food)
      end.to change(Food, :count).by(0)
    end
    it 'redirects to the foods list' do
      delete food_url(food)
      expect(response).to redirect_to(foods_url)
    end
  end
end
