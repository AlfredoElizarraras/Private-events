Rails.application.routes.draw do
  post 'users/logging'
  root 'users#new'
  resources :users, only:  [:show, :new, :create, :sign_in, :logging]
  resources :events, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
