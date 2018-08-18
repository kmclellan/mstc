Rails.application.routes.draw do
  get 'users/new'
  root  'pages#home'
  get  '/home',      to: 'pages#home'
  get  '/help',      to: 'pages#help'
  get  '/about',     to: 'pages#about'
  get  '/contact',   to: 'pages#contact'
  get  '/users/new', to: 'users#new'
  post '/users/new', to: 'users#create'
  resources :users
end
