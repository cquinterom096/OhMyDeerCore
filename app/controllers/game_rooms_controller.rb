class GameRoomsController < ApplicationController
  def create
    room_owner = RoomCreator.new(room_params[:users]).execute
    render json: room_owner, status: 200
  end

  private

  def room_params
    params.require(:users)
  end
end