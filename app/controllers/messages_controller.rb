class MessagesController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    return redirect_to root_path unless @user.id == session[:id]

    @messages = Message.sent_and_received_messages(@user)
  end
end
