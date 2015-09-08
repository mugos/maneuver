Rails.application.routes.draw do
  root to: 'home#index'

  resources :apps
  resources :hosts
  resources :keys

  namespace :api do
    resources :apps
    resources :hosts
    resources :keys
  end
end
