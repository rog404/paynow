Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  
  resources :users, only: %i[index show edit update]
  resources :payments, only: %i[index new create edit update]
  resources :payment_orders, only: %i[index] do
    patch 'approve', on: :member
  end
  resources :payment_orders, only: %i[show], param: :token

  resources :companies, only: %i[index show new create edit update] do
    resources :clients, only: %i[index]
    resources :products, only: %i[index show edit update new create]
    resources :payment_methods, only: %i[index show new create] do
      get 'method_chosen', on: :collection
    end
    patch 'retoken', on: :member
  end

  namespace :api do
    namespace :v1 do
      resources :clients, only: %i[index show create], param: :token
      resources :company_clients, only: %i[create]
      resources :payment_orders, only: %i[show create], param: :token
    end
  end
end
