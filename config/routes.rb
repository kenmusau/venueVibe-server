Rails.application.routes.draw do
  # Admin routes
  # get "/adminSignup", to: "admins#create"

  # session routes
  # admin
  post "/adminlogin", to: "admin_sessions#create"
  delete "/adminlogout", to: "admin_sessions#destroy"

  # Client
  post "/clientSignup", to: "clients#create"
  post "/clientLogin", to: "client_sessions#create"
  delete "/clientLogout", to: "client_sessions#destroy"

  get "/loggedInClient", to: "clients#show"

  resources :payments
  resources :bookings
  resources :spaces
  resources :clients
  resources :admins, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
