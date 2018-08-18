Rails.application.routes.draw do
  root  'pages#home'
  get  '/home',    to: 'pages#home'
  get  '/help',    to: 'pages#help'
  get  '/about',   to: 'pages#about'
  get  '/contact', to: 'pages#contact'
end
