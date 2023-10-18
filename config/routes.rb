Rails.application.routes.draw do
  devise_for :users
  root 'foods#index'
  resources :foods, only: [:index, :new, :create, :show, :destroy]
  resources :recipes, only: [:index, :new, :create, :show, :destroy] do
    member do
      patch :public_toggle
    end
  end
  resources :recipe_foods, only: [:new, :create, :destroy, :edit, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
