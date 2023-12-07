Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :shopping_carts, only: [:show] do
    patch :add_to_cart, on: :member
    patch :remove_from_cart, on: :member
  end

  namespace :admin do
    resources :items
  end
end
