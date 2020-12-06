class SessionsController < ApplicationController
  def new; end

  def create
    if params[:provider] == 'none'
      @user = User.find_by(email: params[:email])
      return render 'new' unless @user&.authenticate(params[:password])

    else
      @user = User.find_or_create_by_auth_hash(auth_hash)
      @user.update(password: SecureRandom.hex)
    end
    session[:id] = @user&.id
    return redirect_to user_path(@user) if @user

    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
