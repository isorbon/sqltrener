Rails.application.routes.draw do
  get 'sessions/new'

  resources :users
  root to: 'altair#home'
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new',via: [:get, :post]
  match '/signin',   to: 'sesions#new',via: [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
