class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]
  before_action :confirm_user, only: %i[edit update destroy]

  def index
    @users = User.with_profile
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.provider = 'none'
    @user.uid = SecureRandom.hex
    return render 'new' unless @user.save

    @user.update(uid: @user.id)
    session[:id] = @user.id
    redirect_to user_path(@user)
  end

  def edit; end

  def update
    return render 'edit' unless @user.update(user_params)

    @user.update(uid: @user.id, provider: 'none') unless @user.provider == 'none'
    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def confirm_user
    redirect_to root_path unless @user&.id == session[:id]
  end
end
