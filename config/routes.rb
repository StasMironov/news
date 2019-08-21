Rails.application.routes.draw do
  resources :microposts, shallow: true do
        resources :comments
  end

  get 'users/new'
  get 'microposts/new'
  get 'microposts/index'


  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'show' => 'users#show'
  get 'results', to: 'results#index', as: 'results'
  post 'comment_create' => 'comments#create'

  resources :tags
  resources :comments

  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'posts' => 'microposts#new'
  resources :users
  resources :microposts
  root 'microposts#index'
end