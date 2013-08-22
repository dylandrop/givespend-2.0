Givespend::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'new' }, :controllers => {:omniauth_callbacks => "authentications", :registrations => 'registrations'}
  resources :users, only: [:show] do
    member do
      get :verify_seller
    end
  end
  match 'my_profile', to: 'users#my_profile', via: :get
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
  resources :reviews, only: [:create, :update]
  match 'preview', to: 'pages#preview', via: :get
  match 'about', to: 'pages#about', via: :get
  match 'contact', to: 'pages#contact', via: :get

  resources :transactions, only: [:show, :create, :index]
  root :to => "items#index"
end
