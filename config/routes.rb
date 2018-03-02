Rails.application.routes.draw do
root 'users#register'

 resources :users,     only: [:create, :index, :show]
 get    'register',    to: 'users#register',   as: 'register'

 get    'login',       to: 'sessions#login',   as: 'login'
 delete 'logout',      to: 'sessions#destroy', as: 'logout'
 resources :sessions,  only: [:create]

 resources :posts,     only: [:create, :show, :destroy]

 resources :comments,  only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
