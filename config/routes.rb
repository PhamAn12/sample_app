Rails.application.routes.draw do
  get "sessions/new"
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users do
    collection do
      get  "/signup" => "users#new"
      post "/signup" => "users#create"
    end
  end
end
