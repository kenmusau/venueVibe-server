Rails.application.routes.draw do
  # Admin routes
  # get "/adminSignup", to: "admins/create"
  post "/adminlogin", to: "admin_sessions#create"
  delete "/adminLogout", to: "admin_sessions#destroy"

  resources :payments
  resources :bookings
  resources :spaces
  resources :clients
  # resources :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
