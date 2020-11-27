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
    @user = User.new(user_params)
    return render 'new' unless password_confirmed? && @user.save

    session[:id] = @user.id
    redirect_to user_path(@user)
  end

  def edit; end

  def update
    return redirect_to 'edit' unless password_confirmed? && @user.update(user_params)

    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).allow(:name, :email, :password, :uid)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def password_confirmed?
    params[:password] && params[:password] == params[:confirmed_password]
  end
end
