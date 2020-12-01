class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    return render 'new' unless @user&.authenticate(params[:password])

    session[:id] = @user.id
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
