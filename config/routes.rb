Rails.application.routes.draw do

  root to: 'altair#home'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users #,only:[:new]
  match '/signup',  to: 'users#new', via: :post
  match '/signin',   to: 'sessions#new', via: :post
  match '/signup',  to: 'users#new', via: :get
  match '/signin',   to: 'sessions#new', via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
