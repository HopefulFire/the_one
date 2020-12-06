class ProfilesController < ApplicationController
  before_action :find_user_and_profile
  before_action :verify_user

  def edit; end

  def update
    return render 'edit' unless @profile.update(profile_params)

    redirect_to user_path(@user)
  end

  private

  def profile_params
    params.require(:profile).permit(
      :nickname,
      :first_name,
      :middle_name,
      :last_name,
      :bio,
      :likes,
      :dislikes,
      :age,
      :user_id
    )
  end

  def find_user_and_profile
    @user = User.find(params[:user_id])
    @profile = Profile.find_or_create_by(user_id: @user.id)
  end

  def verify_user
    redirect_to root_path unless @user.id == session[:id]
  end
end
