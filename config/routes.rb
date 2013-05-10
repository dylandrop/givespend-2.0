Givespend::Application.routes.draw do
  get "nonprofit/show"

  get "nonprofit/index"

  resources :items, only: [:index,:new,:create,:show]
  resources :categories, only: [:show]
  root :to => "items#index"
end
