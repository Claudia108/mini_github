Rails.application.routes.draw do
  root to: 'users#index'
  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/user/repos', to: 'repos#index'
  get '/users/:username/events', to: 'events#index', as: :events
  get '/users/:username/received_events', to: 'received_events#index', as: :received_events
  get '/dashboard', to: 'users#show', as: :user
  get '/gists', to: 'gists#index'
  get '/users', to: 'users#index'
end
