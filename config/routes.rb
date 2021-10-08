Rails.application.routes.draw do
  # password
  get "password/reset"
  post "password/reset"
  get "password/forgot"
  post "password/forgot"
  # user
  resources :users
  # home
  get "home/index"
  get "home/login"
  post "home/login"
  post "home/index"
  # home page
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
