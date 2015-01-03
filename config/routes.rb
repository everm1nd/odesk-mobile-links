Rails.application.routes.draw do
  root 'hubs#new'

  resources :hubs
end
