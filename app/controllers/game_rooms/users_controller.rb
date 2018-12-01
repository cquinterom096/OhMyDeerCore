module GameRooms
  class UsersController < ApplicationController
    def show
      render json: {
        player: user,
        friend: friend,
        title: game_room_title,
        score: user.score
      }, status: 200
    end

    private

    def user
      @user ||= User.find(params[:id])
    end

    def game_room_title
      @game_room_title ||= user.game_room.title
    end

    def friend
      @friend ||= User.find(user.deer_id)
    end
  end
end