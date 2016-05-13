Rails.application.routes.draw do
  resources :users
  root to: 'pages#index'
end