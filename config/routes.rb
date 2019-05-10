Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :categories
  end
  
  root 'staticpages#home'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :categories
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end