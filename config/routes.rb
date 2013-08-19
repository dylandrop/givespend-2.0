Givespend::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'new' }, :controllers => {:omniauth_callbacks => "authentications", :registrations => 'registrations'}
  resources :users, only: [:show] do
    member do
      get :verify_seller
    end
  end
  resources :authentications, only: [:index]
  resources :nonprofits, only: [:index, :show]
  resources :items, only: [:index,:new,:create,:show]
  resources :categories, only: [:show]
  resources :carts do
    collection do
      get :show
      post :add
      delete :remove
      post :checkout
    end
  end

  match 'preview', to: 'pages#preview', via: :get

  resources :transactions, only: [:show, :create, :index]
  root :to => "items#index"
end
