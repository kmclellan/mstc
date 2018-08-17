Rails.application.routes.draw do
  get   'pages/home'
  get   'pages/help'
  get   'pages/contact'
  get   'pages/about'
  root  'application#test'
end
