Rails.application.routes.draw do
  root to: 'home#index'

  resources :apps
  resources :hosts
  resources :keys
  resources :builds

  namespace :api do
    resources :apps
    resources :hosts
    resources :keys
    resources :builds
  end
end
