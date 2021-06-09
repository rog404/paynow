Rails.application.routes.draw do
  root 'home#index'

  resources :payment_methods, only: %i[index]

  resources :companies, only: %i[index show new create edit update] do
    resources :payment_methods, only: %i[index show new create edit update] do
      get 'method_chosen', on: :collection
    end
    patch 'retoken', on: :member
  end
end
