Rails.application.routes.draw do
  post 'likes'      => 'likes#create'
  delete 'likes' => 'likes#destroy'
  get 'likes/destroy'
  get 'top/logout'
  get 'top/login'
  get 'top/error'
  
  get 'tweets/index'
  get 'tweets/new'
  post 'tweets/create'
  post 'top/login_check'
  get 'top/main'
  resources :tweets
  
  resources :users
  root 'users#index'
end
