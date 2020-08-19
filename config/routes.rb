Rails.application.routes.draw do
  
  root to: 'tasks#index'
  

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # resources :sessions, only: [:new, :create, :destroy] としても良いですが、個別にルーティングを設定してます
  
  
  resources :tasks   # 7つのルーティングの省略形
  
  
  # ユーザ登録  今回は、index show 要らない
  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create]
  
end
