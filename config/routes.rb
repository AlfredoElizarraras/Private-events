Rails.application.routes.draw do
  get 'users/sign_in'
  post 'users/logging'
  root 'users#new'
  resources :users, only:  [:show, :new, :create, :sign_in, :logging]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
