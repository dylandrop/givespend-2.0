Givespend::Application.routes.draw do
  resources :items, only: [:index,:new,:create,:show]
  resources :categories, only: [:show]
  root :to => "items#index"
end
