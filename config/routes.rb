Rails.application.routes.draw do
  root to: "passengers#index"
  root to: "drivers#index"

  resources :trips
  resources :passengers do
    resources :trips, only: [:index, :new, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :drivers do
    resources :trips, only: [:index, :new, :show]
  end
end
