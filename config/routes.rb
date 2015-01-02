Rails.application.routes.draw do
  root 'hubs#new'

  resource :hubs
end
