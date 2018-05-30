Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artists, only: [:index, :show]
  resources :events, only: [:index, :show]
  resources :users, only: [:show]
end
