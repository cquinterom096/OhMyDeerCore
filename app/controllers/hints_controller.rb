class HintsController < ApplicationController
  def create

  end

  private

  def friend
    @friend ||= User.find(params[:friend_id])
  end

  def user
    @user ||= User.find(params[:user_id])
  end

  def message
    @message ||= params[:hint]
  end
end