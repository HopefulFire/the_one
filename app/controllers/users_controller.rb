class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update]

  def show; end

  def index
    @users = User.order(nickname: :asc)
  end

  def new
    @user = User.new
  end

  def create

  end

  def edit; end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :uid)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
