Rails.application.routes.draw do
  get 'participations/create'
  get 'participations/update'
  get 'top/main'
  get 'top/login'
  post '/top/login', to: 'top#login'
  get 'top/logout'
  resources :users
  resources :user_profiles,only: [:edit,:index,:show,:update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #root "users#index"
  #root 'fishing_trips#index'
  root 'top#main'
  resources :fishing_trips, only: [:new, :create, :index]
  resources :participations, only: [:create, :update]
  resources :chat_rooms, only: [:show] do
    resources :messages, only: [:create]
  end
end
