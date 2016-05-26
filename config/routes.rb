Rails.application.routes.draw do
  root to: 'users#index'
  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/user/repos', to: 'repos#index'
  get '/dashboard', to: 'users#show', as: :user
  get '/gists', to: 'gists#index'
  get '/users', to: 'users#index'
end
