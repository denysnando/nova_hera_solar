NovaHeraSolar::Application.routes.draw do
  root 'welcomes#index'
  devise_for :users
  resources :welcomes, only: [:index]

  namespace :admin do
    root 'welcomes#index'
    resources :products
    resources :accounts
    resources :welcomes, only: [:index]
    resources :budgets
  end
end
