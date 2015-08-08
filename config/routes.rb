Rails.application.routes.draw do
  devise_for :users
  resources :treads do
    resources :messages
  end
  root to: 'treads#index'
end
