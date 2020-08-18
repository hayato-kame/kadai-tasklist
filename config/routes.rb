Rails.application.routes.draw do
  
  get 'users/new'
  get 'users/create'
      # トップページにアクセスしたときのルーティングを
      #  TasksControllerコントローラのindexアクションに設定する　つまり、
      #  / （トップページ） にアクセスしたときと、 /tasks にアクセスした両方で同じルーティングが設定された
  root to: 'tasks#index'
  
  
  # get 'tasks/:id', to: 'tasks#show'
  # post 'tasks', to: 'tasks#create'
  # put 'tasks/:id', to: 'tasks#update'
  # delete 'tasks/:id', to: 'tasks#destroy'
  
  # get 'tasks', to: 'tasks#index'
  
  # get 'tasks/new', to: 'tasks#new'
  
  # get 'tasks/:id/edit', to: 'tasks#edit'
  
  resources :tasks   # 7つのルーティングの省略形
  
  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create]
  
end
