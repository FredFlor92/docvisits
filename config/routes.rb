Rails.application.routes.draw do
  
  resources :doctors
  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#fbcreate'

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :docvisits

  resources :doctors do
    resources :docvisits, only: [:new, :create, :index]
  end 

end
