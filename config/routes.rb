Rails.application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  get '/beta_signup' => 'beta_signup#view'
  get '/beta_signup/streamer' => 'beta_signup#viewStreamer'
  get '/beta_signup/viewer' => 'beta_signup#viewViewer'

  # You can have the root of your site routed with "root"
  root 'landing#index'

  resources :landing, only: :index
  resources :home, only: :index
  resources :profile, only: :index

  resources :streams do
    collection do
      get "upcoming"
      get "finished"
      get "canceled"
    end
  end

end
