Rails.application.routes.draw do
  devise_for :users
  resources :treads do
    resources :messages
  end
  resources :users, only: [:index]
  root to: 'treads#index'
end
