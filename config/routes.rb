# frozen_string_literal: true

Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'

  post 'signup', to: 'users#create'

  resources :users, only: %i[show update destroy] do
    resources :records
  end

  resources :specializations, only: %i[show update destroy index create] 
  resources :specialist_mappers, only: %i[show update destroy index create]
end
