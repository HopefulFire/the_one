class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]

  def show; end

  def index
    @users = User.order('name asc')
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    redirect_to user_path(user)
  end

  def edit; end

  def update
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).allow(:name, :email, :password, :uid)
  end
end
