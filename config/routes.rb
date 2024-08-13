Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get '/dashboard', to: "pages#dashboard"

  resources :fighters, only: %i[new create edit update destroy]
  resources :events

  get "up" => "rails/health#show", as: :rails_health_check
end
