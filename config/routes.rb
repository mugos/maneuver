Rails.application.routes.draw do
  root to: 'home#index'

  resources :apps do
    resources :hosts, only: [:show] do
      resources :builds
    end
  end
  resources :hosts


  namespace :api do
    resources :apps
    resources :hosts
    resources :builds
  end
end
