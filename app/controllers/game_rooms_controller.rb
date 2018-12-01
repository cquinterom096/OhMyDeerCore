class GameRoomsController < ApplicationController
  def create
    room_owner = RoomCreator.new(params).execute
    render json: {
      player: room_owner
    }, status: 200
  end
end
