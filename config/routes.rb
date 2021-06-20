Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  
  resources :users, only: %i[index show edit update]
  resources :payments, only: %i[index new create edit update]
  resources :payment_orders, only: %i[index] do
    patch 'approve', on: :member
  end

  resources :companies, only: %i[index show new create edit update] do
    resources :clients, only: %i[index]
    resources :products, only: %i[index show edit update new create]
    resources :payment_methods, only: %i[index show new create] do
      get 'method_chosen', on: :collection
    end
    patch 'retoken', on: :member
  end
end
