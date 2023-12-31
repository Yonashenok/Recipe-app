Rails.application.routes.draw do
  devise_for :users
  root 'foods#index'
  resources :public_recipes, only: [:index]
  resources :general_shoppings, only: [:index]
  resources :foods, only: [:index, :new, :create, :show, :destroy]
  resources :recipe_foods, only: [:new, :create, :destroy, :edit, :update]
  resources :recipes, only: [:index, :new, :create, :show, :destroy] do
    member do
      patch :public_toggle
    end
  end
end
