class ProfilesController < ApplicationController
  before_action :find_user
  before_action :exit_unless_logged_in
  before_action :find_profile, only: %i[edit update]

  def new
    @profile = Profile.new(user_id: params[:user_id])
  end

  def create
    @profile = Profile.new(profile_params)
    return send_home unless @user == @profile.user

    return render 'new' unless @profile.save

    send_home
  end

  def edit; end

  def update
    return send_home unless @user == @profile.user

    return render 'edit' unless @profile.update(profile_params)

    send_home
  end

  private

  def profile_params
    params.require(:profile).permit(:user_id, :bio, :likes, :dislikes, :gender, :sex_pref)
  end

  def find_profile
    @profile = Profile.find_by(id: params[:id])
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def exit_unless_logged_in
    redirect_to '/' unless @user
  end

  def send_home
    redirect_to user_path(@user)
  end
end
