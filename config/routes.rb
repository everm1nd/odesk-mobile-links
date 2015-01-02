Rails.application.routes.draw do
  root 'hubs#new'

  resource :hub
end
