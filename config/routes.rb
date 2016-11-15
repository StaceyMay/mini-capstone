Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/view", to: "products#view_products"

  get "/products", to: "products#index"

  get "/products/new", to: "products#new"
  post "/products/create", to: "products#create"

  get "/products/:id", to: "products#show"
  
end
