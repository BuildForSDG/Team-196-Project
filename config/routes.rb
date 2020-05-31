# frozen_string_literal: true

Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'

  post 'auth/signup', to: 'users#create'

  resources :users, only: %i[show update destroy] do
    resources :records
  end

  put 'claim_user_record', to: 'records#update_records'

  resources :specializations, only: %i[show update destroy index create]
  resources :specialist_mappers, only: %i[show update destroy index create]
end
