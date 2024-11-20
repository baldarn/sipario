Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  devise_for :users
  resources :sipario_sessions, only: [ :create ]

  devise_for :owners, controllers: {
    registrations: "owners/registrations"
  }

  resources :certified_presences, only: [ :create ]

  # Defines the root path route ("/")
  root to: "home#index"

  get "download_apk" => "home#download_apk"

  resources :point_events, only: [ :index ]

  resources :providers do
    resources :awards do
      get :redeem
    end

    collection do
      get :search
    end
  end
end
