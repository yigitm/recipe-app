Rails.application.routes.draw do
  resources :recipes, except: :update
  resources :foods
  resources :recipe_foods
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
