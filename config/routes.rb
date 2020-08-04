Rails.application.routes.draw do
  # root 'pages#home'
  get 'about', to: 'pages#about'

  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  # SHORT HAND IF I NEED ALL THE RESTFUL ACTIONS
  resources :articles
end
