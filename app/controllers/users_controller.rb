class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]
  before_action :check_authorization, only: %i[show edit update destroy]

  def show; end

  def index
    @users = User.order(nickname: :asc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    return render 'new' unless @user.save

    redirect_to user_path(@user)
  end

  def edit; end

  def update
    return render 'edit' unless @user.update(user_params)
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :uid
    )
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def check_authorization
    redirect_to root_path unless @user.id == session[:id]
  end
end
