class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:name])
    session[:id] = user.id if user&.password == params[:password]
  end

  def destroy
    session.clear
  end
end
