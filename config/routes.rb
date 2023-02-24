Rails.application.routes.draw do
  resources :responses
  resources :fields
  resources :forms
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "forms#index"
  post '/forms/store_labels', to: 'forms#store_labels'
  post '/fields/show_labels', to: 'fields#show_labels'

end
