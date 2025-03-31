Rails.application.routes.draw do
  devise_for :admins

  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for "Member", at: "auth"
    end
    namespace :v1 do
      resources :access, only: [ :create ]
    end
  end

  resources :members
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "members#index"

  # Expo user confirmation page
  get "account_confirmation" => "user_confirmations#index"

  # QR code page
  get "access_code" => "qr_codes#index"
end
