Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "users#home"

  get "/users/:id/" => 'users#show'
  get "/index" => 'users#index'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
  
  resources :games
end
