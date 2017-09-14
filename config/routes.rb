Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :videos
  resources :groups

  get "/tubing", to: 'videos#tubing'

  get '/signup', to: 'users#new'

  post '/signin', to: 'sessions#create'

  post '/logout', to: 'sessions#destroy'

  get '/notes/new/:time', to: 'notes#new'

  post '/notes', to: 'notes#create'

  post '/search_users', to: 'users#search'
end
