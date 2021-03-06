Rails.application.routes.draw do

  root to: 'altair#home'
  get '/signup',    to: 'users#new'
  get '/signin',    to: 'sessions#new'
  get '/signout',   to: 'sessions#destroy'
  get '/im',        to: 'users#show'
  post '/upd',      to: 'users#update'
  post '/signin',   to: 'sessions#create'
  post '/signup',   to: 'users#create'
  post '/block',    to: 'block#create'
  post '/db',       to: 'uses#update'
  post 'del',       to: 'admin#destroy'
  get '/home',      to: 'altair#home'
  get '/about',     to: 'altair#about'
  get '/help',      to: 'altair#help'
  get '/contact',   to: 'altair#contact'
  get '/theory',    to: 'altair#theory'
  get '/admin',     to: 'admin#show'
  get '/block',     to: 'block#show'
  get '/db',        to: 'uses#db_con'
  get '/sh',        to: 'admin#persons'
  post '/edit',     to: 'admin#edit'
  post '/tab',      to: 'admin#tables'
  get   'category', to: 'cats#show'
  post   'category',to: 'cats#create'
  post   'categoryd',            to: 'cats#destroy'
  post   'categoryu',            to: 'cats#update'
  post   'categorye',            to: 'cats#edit'

  post   'taske',            to: 'tasks#edit'
  get   'taskm',            to: 'tasks#new'
  get   'taskl',            to: 'tasks#show'
  post   'taskm',            to: 'tasks#create'
  post   'tasku',            to: 'tasks#update'
  post   'taskd',            to: 'tasks#destroy'

  get    'testn'   ,               to:'tests#new'
  post    'testn'   ,               to:'tests#create'
  get    'tests'   ,               to:'tests#show'
  post    'testu'   ,               to:'tests#update'
  post    'teste'   ,               to:'tests#edit'
  post    'testd'   ,               to:'tests#destroy'
  get     'tpn'                      ,to:'tpublics#new'
  post     'tpn'                      ,to:'tpublics#create'

  get 'start' ,to:  'studet_t#new'
end

