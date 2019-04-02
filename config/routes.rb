Rails.application.routes.draw do
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  resources :users do
    collection do
      get  "/signup" => "users#new"
      post "/signup" => "users#create"
    end
  end
end
