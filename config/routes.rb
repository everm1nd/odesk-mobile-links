Rails.application.routes.draw do
  root 'apps#new'

  resources :apps
end
