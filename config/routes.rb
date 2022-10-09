Rails.application.routes.draw do
  # GET /about
  get "professional", to: "professional#index"
  get "private", to: "private#index"

  root to: "main#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
