Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate' 
 
  post 'signup', to: 'users#create' 

  resources :users, only: [:show, :update, :destroy] do
    resources :records
  end
end
