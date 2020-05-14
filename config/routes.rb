Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate' 
 
  post 'signup', to: 'users#create' 

  resource :user, only: [:show, :update, :destroy] do
    resource :records 
  end
end
