Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/view", to: "products#view_products"

  get "/products", to: "products#index"

  get "/products/new", to: "products#new"
  post "/products/create", to: "products#create"

  get "/products/:id/edit", to: "products#edit"
  patch "/products/:id", to: "products#update"

  delete "/products/:id", to: "products#destroy"

  get "/products/:id", to: "products#show"

  post "/search", to: "products#search"

  get "/suppliers", to: "suppliers#index"

  get "/suppliers/new", to: "suppliers#new"
  post "/suppliers/create", to: "suppliers#create"

  get "/suppliers/:id/edit", to: "suppliers#edit"
  patch "/suppliers/:id", to: "suppliers#update"

  get "suppliers/:id", to: "suppliers#show"

  delete "products/:id", to: "suppliers#destroy"

end
