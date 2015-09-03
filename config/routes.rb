Rails.application.routes.draw do
  root to: 'home#index'

  resources :apps

  namespace :api do
    resources :apps
  end
end
