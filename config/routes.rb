Rails.application.routes.draw do
  root to: 'home#show'
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :home, only: [:index, :show]

  resources :users do
    resources :photos
    resources :albums
  end
  resources :images
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :user_followings, only: [:create, :destroy]
end
