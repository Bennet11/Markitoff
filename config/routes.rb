Rails.application.routes.draw do
  get 'users/show'

  devise_for :users

  resources :users, only: [:show] do
    resources :items, only: [:create, :destroy]
  end

  get 'welcome/about'

  get 'welcome/index'

  root 'users#show'
end
