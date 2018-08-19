Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get    'sessions/new'
  get    'users/new'
  root   'pages#home'
  get    '/home',      to: 'pages#home'
  get    '/help',      to: 'pages#help'
  get    '/about',     to: 'pages#about'
  get    '/contact',   to: 'pages#contact'
  get    '/users/new', to: 'users#new'
  post   '/users/new', to: 'users#create'
  get    '/login',     to: 'sessions#new'
  post   '/login',     to: 'sessions#create'
  delete '/logout',    to: 'sessions#destroy'
  resources :users
  resources :user_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
