Rails.application.routes.draw do
  root to: 'home#show'
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' },
                     controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :home, only: [:index, :show]

  resources :users do
    resources :photos
    resources :albums
  end
  resources :images

  resources :user_followings, only: [:create, :destroy]

  resources :admins
end
