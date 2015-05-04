Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "users#home"

  get "/users/:id/" => 'users#show'
  get "/index" => 'users#index'
  resources :games
end
