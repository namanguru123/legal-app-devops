Rails.application.routes.draw do
  resources :cases
  devise_for :users
  root "home#index"
end