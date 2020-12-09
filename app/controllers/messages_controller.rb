class MessagesController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    
    @messages = Message.where('message.sender_id = ? OR message.receiver_id = ?', @user.id, @user.id)
  end
end
