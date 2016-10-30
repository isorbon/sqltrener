Rails.application.routes.draw do

  root to: 'altair#home'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users #,only:[:new]
  match '/signup',  to: 'users#new', via: [:get, :post]
  match '/signin',   to: 'sessions#new', via:   [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
