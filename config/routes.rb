Rails.application.routes.draw do
  resources :flights, only: [:show, :index]
  resources :bookings, only: [:new, :create, :show]
  root 'flights#index'
end
