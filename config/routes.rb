Rails.application.routes.draw do
  draw(:hotwire_native)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    unlocks: "users/unlocks",
    confirmations: "users/confirmations"
  }
  resources :sipario_sessions, only: [ :create ]

  devise_for :owners, controllers: {
    registrations: "owners/registrations",
    sessions: "owners/sessions",
    passwords: "owners/passwords",
    unlocks: "owners/unlocks",
    confirmations: "owners/confirmations"
  }

  resources :certified_presences, only: [ :create ]

  # Defines the root path route ("/")
  root to: "home#index"

  get "download_android" => "home#download_android"
  get "download_apple" => "home#download_apple"

  resources :point_events, only: [ :index ] do
    get :consume_code
  end

  resources :providers do
    resources :awards do
      get :redeem
      get :consume
    end

    collection do
      get :search
    end
  end
end
