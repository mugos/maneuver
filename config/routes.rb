Rails.application.routes.draw do
  resources :apps

  namespace :api do
    resources :apps
  end
end
