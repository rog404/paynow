Rails.application.routes.draw do
  root 'home#index'
  resources :companies, only: %i[index show new create edit update] do
    patch 'retoken', on: :member
  end
end
