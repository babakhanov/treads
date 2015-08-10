Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index]

  resources :treads do
    resources :messages
  end

  root to: 'pages#index'

end
