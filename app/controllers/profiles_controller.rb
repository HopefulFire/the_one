class ProfilesController < ApplicationController
  before_action :find_user
  before_action :exit_unless_logged_in
  before_action :find_profile, only: %i[edit update]

  def new
    @profile = Profile.new(user_id: params[:user_id])
  end

  def create
    @profile = Profile.new(profile_params)
    return redirect_to user_path(@user) unless @user == @profile.user

    return render 'new' unless @profile.save

    redirect_to user_path(@user)
  end

  def edit; end

  def update
    return redirect_to user_path(@user) unless @user == @profile.user

    return render 'edit' unless @profile.update(profile_params)

    redirect_to user_path(@user)
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
end
