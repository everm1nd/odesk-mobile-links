Rails.application.routes.draw do
  scope Rails.application.config.action_controller.relative_url_root do
    root 'apps#new'

    resources :apps

    get '/a/:hashid', to: 'apps#shortlink'
  end
end
