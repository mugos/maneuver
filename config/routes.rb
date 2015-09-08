Rails.application.routes.draw do
  root to: 'home#index'

  resources :apps
  resources :hosts
  
  namespace :api do
    resources :apps
    resources :hosts
  end
end
