Rails.application.routes.draw do
  root "home#index"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  get "books", to:"home#books" , as: "books"
  get "review", to:"home#review" , as: "review"
  match "/donate_books", to:"home#donate_books" , :via => :get
  match "/donate",to:"home#create_donate",:via=>:post

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
