class MessagesController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    return redirect_to root_path unless @user.id == session[:id]

    @messages = Message.where(
      'sender_id = ? OR receiver_id = ?',
      @user.id,
      @user.id
    ).order(created_at: :desc)
  end
end
