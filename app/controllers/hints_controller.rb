class HintsController < ApplicationController
  def create
    @hint_id = HintCreator.new(user, friend, hint).execute
    if @hint_id
      render json: 'success', status: 200
    else
      render json: 'error', status: 406
    end
  end

  private

  def friend
    @friend ||= User.find(params[:friend_id])
  end

  def user
    @user ||= User.find(params[:user_id])
  end

  def hint
    @message ||= params[:hint]
  end
end