class SessionsController < ApplicationController
  def new; end

  def create; end

  def destroy
    session[:id].delete

    redirect_to root_path
  end
end
