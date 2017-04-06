Rails.application.routes.draw do
  
  get 'pages/home'

  devise_for :users
  resources :product_dates
  resources :product_images
  resources :reports do 
      resources :seguimientos
  end
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
  get "seguimientos_all/:id", to: "reports#seguimientos_all", as: "seguimientos_all"
  post "create_plant", to: "reports#create_plant" , as: "create_plant"
  post "create_yarn", to: "reports#create_yarn" , as: "create_yarn"
  post "create_merge", to: "reports#create_merge" , as: "create_merge"
  post "create_filament", to: "reports#create_filament" , as: "create_filament"
  post "create_customer", to: "reports#create_customer" , as: "create_customer"
  post "create_problem", to: "reports#create_problem" , as: "create_problem"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
