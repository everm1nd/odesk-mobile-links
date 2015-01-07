Rails.application.routes.draw do
  root 'apps#new'

  resources :apps

  get '/a/:hashid', to: 'apps#shortlink'
end
