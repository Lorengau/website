Rails.application.routes.draw do
  # GET /about
  get "resume", to: "resume#index"
  get "blog", to: "blog#index"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  root to: "main#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
