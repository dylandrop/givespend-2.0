Givespend::Application.routes.draw do
  get "categories/show"

  get "items/new"

  get "items/create"

  get "items/show"

  get "items/index"

  resources :items, only: [:index,:new,:create,:show]
  resources :categories, only: [:show]
  root :to => "items#index"
end
