Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get '/dashboard', to: "pages#dashboard"
  get '/planning', to: "pages#planning"
  resources :fighters do
    resources :events, only: %i[new create]
  end

  resources :events, only: %i[index show edit update destroy] do
    resources :reviews, only: %i[create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "up" => "rails/health#show", as: :rails_health_check
end
