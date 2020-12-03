class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update]

  def show; end

  def index
    @users = User.order(nickname: :asc)
  end

  def edit; end

  def update; end

  private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def boot_unauthorized
    redirect_to root_path unless @user.id == session[:id]
  end
end
