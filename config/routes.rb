Rails.application.routes.draw do
  root 'teams#index'
  get '/players', to: 'players#index'
  get '/player/:id', to: 'players#player', as: 'player'
  get '/year/:year(/:rank)', to: 'players#year', as: 'by_year'
end
