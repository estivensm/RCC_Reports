Rails.application.routes.draw do
  resources :seguimientos
  get 'pages/home'

  devise_for :users
  resources :product_dates
  resources :product_images
  resources :reports
  resources :yarn_types
  resources :specific_problems
  resources :plants
  resources :merges
  resources :filament_counts
  resources :customers
  root "pages#home"
  get '/get_country/:id', to: 'reports#get_country', as: 'get_country'
  get '/tracing_report/:id', to: 'reports#tracing_report', as: 'tracing_report'
  post 'create_tracing' , to: 'reports#create_tracing', as: 'create_tracing'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
