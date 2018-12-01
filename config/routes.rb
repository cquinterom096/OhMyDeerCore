Rails.application.routes.draw do
  require "sidekiq/web"
  mount Sidekiq::Web => "/slave_deers"

  resources :game_rooms, only: [:create]
  namespace :game_room do
    resources :users, only: [:show]
  end
  resources :hints, only: [:create]
end
