Rails.application.routes.draw do
  resources :responses
  resources :fields
  resources :forms
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "forms#new"
  post '/forms/store_labels', to: 'forms#store_labels'
  # get '/forms/:id', to: 'forms#show'
  post '/fields/show_labels', to: 'fields#show_labels'

end
