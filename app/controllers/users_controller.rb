class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.provider = 'None'
    @user.uid = SecureRandom.hex
    render 'new' unless @user.save
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
