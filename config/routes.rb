Rails.application.routes.draw do
  root to: "passengers#index"
  root to: "drivers#index"

  resources :passengers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :drivers
end
