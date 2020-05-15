Rails.application.routes.draw do
  root 'welcome#show'
  get 'users/sign_in'
  post 'users/logging'
  post 'events/attend_to_event'
  get 'users/sign_out'
  post 'events/invite_to_event'
  resources :users, only:  [:show, :new, :create, :sign_in, :logging, :sign_out]
  resources :events, only: [:index, :show, :new, :create, :attend_to_event, :invite_to_event]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
  