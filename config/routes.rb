Rails.application.routes.draw do
  root  'pages#home'
  get   'pages/home'
  get   'pages/help'
  get   'pages/contact'
  get   'pages/about'
end
