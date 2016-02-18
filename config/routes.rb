Rails.application.routes.draw do
  root 'home#show'
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'dashboard', to: 'users#show'
  get '/logout', to: 'sessions#destroy'
end
