Rails.application.routes.draw do
  root 'teams#index'
  get '/teams', to: 'teams#teams', as: 'teams'
  get '/team/:id', to: 'teams#team', as: 'team'
  get '/players', to: 'players#index', as: 'players'
  get '/player/:id', to: 'players#player', as: 'player'
  get '/year/:year(/:rank)', to: 'players#year', as: 'by_year'
end
