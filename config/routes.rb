Rails.application.routes.draw do
  root "operating_systems#index"

  resources :operating_systems, only: [:index, :create]
end
