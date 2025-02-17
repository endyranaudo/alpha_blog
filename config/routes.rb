Rails.application.routes.draw do
  # root 'pages#home'
  get 'about', to: 'pages#about'
  
  get 'signup', to: "users#new"
  resources :users, except: [:new]

  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  # SHORT HAND IF I NEED ALL THE RESTFUL ACTIONS
  resources :articles

end
