Rails.application.routes.draw do
 root to: 'companies#index'
 
 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
 
 resources :companies, only: [:index, :show, :edit, :update, :destroy]
 resources :recruits, only: [:show, :edit, :update, :destroy]
 resources :members, only: [:show, :edit, :update, :destroy]
 
 resources :users, only: [:index, :show, :edit, :update, :destroy]
end
