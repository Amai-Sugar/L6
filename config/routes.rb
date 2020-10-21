Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  get 'top/logout'
  get 'top/login'
  get 'top/error'
  
  get 'tweets/index'
  get 'tweets/new'
  post 'tweets/create'
  post 'top/login_check'
  resources :tweets
  
  resources :users
  root 'users#index'
end
