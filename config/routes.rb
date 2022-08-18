# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :users
  resources :sessions, only: %i[new create destroy]
  get 'index', to: 'home#index', as: 'index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'user_profile', to: 'users#users_profile_page', as: 'users_profile_page'
  match '/schedule/:date', to: 'home#schedule', via: :get
  match '/schedule', to: 'home#schedule', via: :get
  match '/schedule_post', to: 'home#schedule_post', via: :post
  get 'book', to: 'home#book', as: 'book'
  match '/donate_books', to: 'home#donate_books', via: :get
  match '/donate', to: 'home#create_donate', via: :post
  match '/suggest_book', to: 'home#suggestingbooks', via: :post
  match '/book', to: 'home#book', via: :get
  get 'donate_list', to: 'home#donatelist_showing', as: 'donate_list'
  get 'book_list', to: 'home#booklist_showing', as: 'book_list'
  get 'suggestBook_list', to: 'home#suggestBook_list', as: 'suggestBook_list'
  get 'schedule_list', to: 'home#schedule_list', as: 'schedule_list'
  match '/book_create', to: 'home#book_create', via: :post
  match '/roles', to: 'users#roles', via: :get
  match '/add_role', to: 'users#add_role', via: :post
  match '/category', to: 'home#category', via: :get
  match '/add_category', to: 'home#add_category', via: :post
  match '/create_review', to: 'home#create_review', via: :post
  get '/available/:id' => 'home#available', as: :available
  get '/unavailable/:id' => 'home#unavailable', as: :unavailable
  get '/delete_book/:id' => 'home#delete_book', as: :delete_book
  get '/delete_slot/:id' => 'home#delete_slot', as: :delete_slot
  get '/delete_donate/:id' => 'home#delete_donate', as: :delete_donate
  get '/delete_suggest/:id' => 'home#delete_suggest', as: :delete_suggest
  post '/update_profile' => 'users#update_profile', as: :update_profile

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
