Rails.application.routes.draw do
  devise_for :customers
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :users, :only => [:show]
  resources :customers, :only => [:show]

  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
  
  
  

end
