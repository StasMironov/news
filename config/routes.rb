Rails.application.routes.draw do
  get 'users/new'
  get 'microposts/new'
  get 'microposts/index'
  get 'create_micropost' => 'microposts/show'

  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'show' => 'users#show'
  get 'results', to: 'results#index', as: 'results'


  resources :tags

  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'posts' => 'microposts#new'
  resources :users
  resources :microposts
  root 'microposts#index'
end