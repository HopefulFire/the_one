class SessionsController < ApplicationController
  def new; end

  def create
    if params[:provider] == 'none'
      @user = User.find_by(email: params[:email])
      return render 'new' unless @user&.authenticate(params[:password])
    end
    @user = User.find_or_create_by_auth_hash(auth_hash)
  end

  def destroy
    session[:id].delete
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
