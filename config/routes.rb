Rails.application.routes.draw do

  get 'welcome/index'


  root 'welcome#index'


  resources :appointments
  resources :patients
  resources :physicians


  get 'signin' => 'sessions#new'
  post '/sessions/create' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
