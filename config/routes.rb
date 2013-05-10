Givespend::Application.routes.draw do
  get "authentications/new"

  get "authentications/index"

  get "authentications/create"

  get "users/new"

  get "users/create"

  get "users/show"

  devise_for :users

  resources :nonprofits, only: [:index, :show]
  resources :items, only: [:index,:new,:create,:show]
  resources :categories, only: [:show]
  root :to => "items#index"
end
