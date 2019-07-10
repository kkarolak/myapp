Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    get 'dashboard/index'
    resources :users
    resources :articles do
      resources :comments
    end
  end
  root 'static_pages#root'
  get 'about', to: 'pages#about'
  resources :users, expect: [:new]
  resources :articles do
    resources :comments
  end
end
