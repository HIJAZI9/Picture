Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # Root URL , default homepage
  root 'main#index'
  resources :users, only: [:destroy]
  # POST request to upload an image
  post 'upload', to: 'main#create', as: 'upload_image'
  # GET request to show an uploaded image by ID
  get 'uploaded_image/:id', to: 'main#show', as: 'show_uploaded_image'
  # DELETE request to delete a user's image by ID
  delete '/users/:id/delete_image', to: 'users#delete_image', as: 'delete_image_user'

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
