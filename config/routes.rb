Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :articles, only: [:create]
  end
  resources :articles do
    resources :comments
  end
  root 'articles#index'
  get 'users/set_admin/:id' => 'users#set_admin'
end
