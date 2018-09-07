# frozen_string_literal: true

Rails.application.routes.draw do
  get 'resources/new'
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
  get    '/resources/new', to: 'resources#new'
  post    '/resources/new', to: 'resources#create'
  resources :users
  resources :user_activations, only: [:edit]
  resources :password_resets, only: %i[new create edit update]
  resources :resources
end
