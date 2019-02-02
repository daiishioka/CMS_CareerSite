Rails.application.routes.draw do
 root to: 'registered_companies_pages#index'
 
 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
 
end
