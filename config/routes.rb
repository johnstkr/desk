Rails.application.routes.draw do
  root "filters#index"

  resources :filters

  resources :cases

  resources :labels
end
