Rails.application.routes.draw do
  get 'recipes/public', to: 'public#index'
  resources :recipes, only: %i[index show new create update destroy]
  resources :foods, only: %i[index new create destroy]
  resources :recipe_foods, only: %i[edit update new create destroy]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'shopping', to: 'shopping#index'
  # Defines the root path route ("/")
  # root "articles#index"
  
  root :to => redirect('/users/sign_in')
end
