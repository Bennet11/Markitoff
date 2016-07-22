Rails.application.routes.draw do
  get 'users/show'

  devise_for :users

  resources :users, only: [:show]

  get 'welcome/about'

  get 'welcome/index'

  root 'users#show'
end
