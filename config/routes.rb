Rails.application.routes.draw do
  root 'campaigns#index'
  resources :campaigns
  resources :cuepoints do
    resources :campaigns, only: [:index]
  end
  get 'results', to: 'results#index'
  get 'results/record'

end
