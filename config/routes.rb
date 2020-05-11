Rails.application.routes.draw do
  root "users#new"
  get 'users/sign_in'
  post 'users/logging'
  get 'users/sign_out'
  resources :users, only: [:new, :create, :show, :sign_in, :logging, :sign_out]
  #get 'users/new'
  #get 'users/create'
  #get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
