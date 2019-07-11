Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    get 'dashboard/index'
    devise_for :users
    resources :users
    resources :articles do
      resources :comments
    end
  end
  root 'static_pages#root'
  get 'about', to: 'static_pages#about'
  resources :users, expect: [:new]
  resources :articles do
    resources :comments
  end
end
