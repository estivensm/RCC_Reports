Rails.application.routes.draw do
  resources :product_dates
  resources :product_images
  resources :reports
  resources :yarn_types
  resources :specific_problems
  resources :plants
  resources :merges
  resources :filament_counts
  resources :customers
  root "reports#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
