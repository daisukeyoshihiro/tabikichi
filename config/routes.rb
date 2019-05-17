Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :categories do
      resources :words
    end
  end

  resources :lessons do
    resources :answers, only: [:new, :create]
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
  get 'words', to: 'words#index'
  get 'dashbord', to: 'dashbord#index'
end