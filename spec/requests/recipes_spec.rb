require 'rails_helper'

RSpec.describe '/recipes', type: :request do
  let(:user) { User.create(email: 'foo@gmail.com', name: 'foo', password: 'passsword12') }
  let(:recipe) do
    Recipe.create(name: 'buger', preparation_time: '1 hour', cooking_time: '30 minutes',
                  description: 'Testing testing', public: false, user:)
  end

  before(:each) do
    sign_in user
    get foods_path
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get recipes_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get recipe_url(recipe)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_recipe_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Recipe' do
        expect do
          post recipes_url, params: { recipe: { name: 'buger', preparation_time: '1 hour', cooking_time: '30 minutes',
                                                description: 'Testing testing', public: false, user: } }
        end.to change(Recipe, :count).by(1)
      end

      it 'redirects to the created recipe' do
        post recipes_url, params: { recipe: { name: 'buger', preparation_time: '1 hour', cooking_time: '30 minutes',
                                              description: 'Testing testing', public: false, user: } }
        expect(response).to redirect_to(recipes_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Recipe' do
        expect do
          post recipes_url, params: { recipe: { name: nil, preparation_time: nil, cooking_time: '30 minutes',
                                                description: 'Testing testing', public: false, user: } }
        end.to change(Recipe, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post recipes_url, params: { recipe: { name: nil, preparation_time: nil, cooking_time: '30 minutes',
                                              description: 'Testing testing', public: false, user: } }
        expect(response).to have_http_status(:unprocessable_entity)
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
