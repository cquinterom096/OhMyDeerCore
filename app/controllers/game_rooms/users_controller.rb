module GameRooms
  class UsersController < ApplicationController
    def show
      render json: {
        player: user,
        friend: friend,
        title: game_room.title,
        address: game_room.address,
        time: game_room.end_date,
        score: user.score
      }, status: 200
    end

    private

    def user
      @user ||= User.find(params[:id])
    end

    def game_room
      @game_room_title ||= user.game_room
    end

    def friend
      @friend ||= User.find(user.deer_id)
    end
  end
end