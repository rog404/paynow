Rails.application.routes.draw do
  root 'home#index'

  resources :payments, only: %i[index new create edit create update]

  resources :companies, only: %i[index show new create edit update] do
    resources :products, only: %i[index show edit update new create]
    resources :payment_methods, only: %i[index show new create edit update] do
      get 'method_chosen', on: :collection
    end
    patch 'retoken', on: :member
  end
end
