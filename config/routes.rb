Rails.application.routes.draw do
  root "operating_systems#index"

  resources :operating_systems, only: [:index, :create] do
    resources :phones, only: [:index]
  end
  resources :phones, only: [:index, :create]
end
