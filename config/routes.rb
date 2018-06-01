Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artists, only: [:index, :show]
  resources :events, only: [:index, :show]
  resources :users, only: [:show]

  root to: "static#welcome"

  get '/signup', to: "users#new", as: 'signup'
  post '/signup', to: "users#create"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"

  post '/logout', to: "sessions#logout", as: 'logout'

  post '/add_event', to: "users#add_event", as: 'add_event'

  get 'search(/:q)', to: "static#search", as: 'search'

end
