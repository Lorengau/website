Rails.application.routes.draw do
  devise_for :users
  # GET /about
  get "resume", to: "resume#index"
  get "blog", to: "blog#index"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  root to: "main#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  authenticated :user do
    root 'main#index', as: :authenticated_root
  end
  unauthenticated :user do
    root 'main#unregistered', as: :unauthenticated_root
  end
end
