require 'rails_helper'

RSpec.describe 'RecipeFoods', type: :request do
  let(:user) { User.create(email: 'foo@gmail.com', name: 'foo', password: 'passsword12') }
  let(:food) { Food.create(name: 'Apple', measurement_unit: 'gram', price: 10, quantity: 30, user:) }
  let(:recipe) do
    Recipe.create(name: 'buger', preparation_time: '1 hour', cooking_time: '30 minutes',
                  description: 'Testing testing', public: false, user:)
  end
  before(:each) do
    sign_in user
    get foods_path
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_recipe_food_path(recipe_id: recipe.id)
      expect(response).to be_successful
    end
  end


  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Recipe' do
        expect do
          post recipe_foods_path, params: { recipe_food: { quantity: 3, food_id: food.id, recipe_id: recipe.id } }
        end.to change(Recipe, :count).by(1)
      end

      it 'redirects to the created recipe' do
        post recipe_foods_path, params: { recipe_food: { quantity: 3, food_id: food.id, recipe_id: recipe.id } }
        expect(response).to redirect_to(recipe_url(user_id: user.id, id: recipe.id))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested recipe' do
      expect do
        delete recipe_url(recipe)
      end.to change(Recipe, :count).by(0)
    end

    it 'redirects to the recipes list' do
      delete recipe_url(recipe)
      expect(response).to redirect_to(recipes_url)
    end
  end
end
