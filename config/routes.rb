Rails.application.routes.draw do




  root to: 'altair#home'
  get '/signup',   to: 'users#new'
  get '/signin',   to: 'sessions#new'
  get '/im',   to: 'users#show'
  post '/signin', to: 'sessions#create'
  post '/signup',   to: 'users#create'
  get '/home',   to: 'altair#home'
  get '/about',   to: 'altair#about'
  get '/help',   to: 'altair#help'
  get '/contact',   to: 'altair#contact'
  get '/theory',   to: 'altair#theory'
  get '/admin',to: 'admin#show'
  get '/admin',to: 'admin#show'
  get '/tour',to: 'uses#new'
  post '/tour',to: 'uses#create'
  get 'uses/db_con'


end
