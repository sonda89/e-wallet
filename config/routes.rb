Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "wallets#index"

  resources :wallets, except: :show
  resources :withdraw_transactions, only: [:new, :create]
  resources :deposit_transactions, only: [:new, :create]
  resources :transfer_transactions, only: [:new, :create]
  resources :transactions, only: :index
end
