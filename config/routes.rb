Rails.application.routes.draw do
  root 'home#index'
  resources :companies, only: %i[index show new create]
end
