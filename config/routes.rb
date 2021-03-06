Myflix::Application.routes.draw do
  root to: "pages#front"
  get 'ui(/:action)', controller: 'ui'
  get 'home', to: "videos#index"
  get 'register', to: "users#new"
  get 'sign_in', to: "sessions#new"
  get 'sign_out', to: "sessions#destroy"
  get 'my_queue', to: "queue_items#index"
  get 'people', to: "relationships#index"
  get 'register/:token', to: "users#new_with_invitation_token", as: 'register_with_token'
  get 'forgot_password', to: 'forgot_passwords#new'
  get 'forgot_password_confirmation', to: 'forgot_passwords#confirm'
  resources :forgot_passwords, only: [:create]
  resources :videos, only: [:show] do
    collection do
      post :search, to: "videos#search"
    end
    resources :reviews, only: [:create]
  end
  resources :categories, only: [:show]
  resources :invitations, only: [:new, :create]
  resources :users, only: [:create, :show]
  resources :sessions, only: [:create]
  resources :queue_items, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :password_resets, only: [:show, :create]
  get 'expired_token', to: 'pages#expired_token'
  post 'update_queue', to: "queue_items#update_queue"
end
