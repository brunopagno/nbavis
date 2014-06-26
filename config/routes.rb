Rails.application.routes.draw do
  root 'pages#home'
  get '/players', to: 'players#index'
  get '/players/:year(/:rank)', to: 'players#year', as: 'by_year'
end
