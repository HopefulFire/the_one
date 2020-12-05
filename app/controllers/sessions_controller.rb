class SessionsController < ApplicationController
  def new; end

  def create
    if params[:provider] == 'none'
      @user = User.find_by(email: params[:email])
      return render 'new' unless @user.authenticate(params[:password])
    end
    puts 'We dont know what to do here'
  end

  def destroy
    session[:id].delete
    redirect_to root_path
  end
end
