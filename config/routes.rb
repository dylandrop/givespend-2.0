Givespend::Application.routes.draw do
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'new' }, :controllers => {:omniauth_callbacks => "authentications", :registrations => 'registrations'}
  resources :users do
    member do
      get :verify_seller
    end
  end
  resources :authentications, only: [:index]
  resources :nonprofits, only: [:index, :show]
  resources :items, only: [:index,:new,:create,:show]
  resources :categories, only: [:show]
  root :to => "items#index"
end
