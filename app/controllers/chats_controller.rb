class ChatsController < ApplicationController
  before_action :verify_session_and_find_user

  def index
    @chat_users = (@user.sent_users + @user.received_users).uniq
  end

  private

  def verify_session_and_find_user
    redirect_to root_path unless session[:id]
    @user = User.find(session[:id])
    redirect_to root_path unless @user.profile
  end
end
