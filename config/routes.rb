Givespend::Application.routes.draw do
  devise_for :users

  resources :nonprofits, only: [:index, :show]
  resources :items, only: [:index,:new,:create,:show]
  resources :categories, only: [:show]
  root :to => "items#index"
end
