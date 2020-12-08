class ChatsController < ApplicationController
  before_action :verify_session_and_find_user

  def index
    @chat_users = (@user.sent_users + @user.received_users).uniq
  end

  def show
    @chat_user = User.find_by(id: params[:id])
    @messages = Message.where(
      'sender_id = ? OR sender_id = ?',
      @user.id,
      @chat_user.id
    ).order(created_at: :desc).limit(50).reverse
    @new_message = Message.new(sender: @user, receiver: @chat_user)
  end

  def update
    message = Message.create(message_params)
    redirect_to chat_path(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:body, :sender_id, :receiver_id)
  end

  def verify_session_and_find_user
    redirect_to root_path unless session[:id]
    @user = User.find(session[:id])
    redirect_to root_path unless @user.profile
  end
end
