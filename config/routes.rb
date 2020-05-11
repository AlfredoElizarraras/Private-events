Rails.application.routes.draw do
  root 'users#sign_in'
  post 'users/logging'
  resources :users, only:  [:show, :new, :create, :sign_in, :logging]
  resources :events, only: [:index, :show, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
  