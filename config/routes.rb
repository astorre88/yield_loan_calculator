Rails.application.routes.draw do
  root 'calculations#new'
  resources :calculations, only: [:new, :create]
  resources :users, only: :create
end
