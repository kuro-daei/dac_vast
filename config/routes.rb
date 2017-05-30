Rails.application.routes.draw do
  root 'campaigns#index'
  resources :campaigns
  resources :cuepoints
  resources :reports

end
