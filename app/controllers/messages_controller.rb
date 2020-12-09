class MessagesController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    return redirect_to root_path unless @user.id == session[:id]

    @messages = Message.where('message.sender_id = ? OR message.receiver_id = ?', @user.id, @user.id)
  end
end
