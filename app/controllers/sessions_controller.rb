class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    session[:id] = user.id if user&.authenticate(params[:password])
  end

  def destroy
    session.clear
  end
end
