Rails.application.routes.draw do
  require "sidekiq/web"
  mount Sidekiq::Web => "/slave_deers"

  resources :game_rooms, only: [:create]
  resources :users, only: [:show]
  resources :hints, only: [:create]
end
