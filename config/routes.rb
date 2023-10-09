Rails.application.routes.draw do
  # Admin routes
  # get "/adminSignup", to: "admins/create"
  post "/adminlogin", to: "admin_sessions#create"
  delete "/adminlogout", to: "admin_sessions#destroy"

  post "/clientlogin", to: "client_sessions#create"
  delete "/clientlogout", to: "client_sessions#destroy"

  resources :payments
  resources :bookings
  resources :spaces
  resources :clients
  resources :admins, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
