class ProfilesController < ApplicationController
  before_action :find_user_and_exit_unless_match

  def new; end

  def create
    return render 'new' unless @user.update(profile_params)

    send_home
  end

  def edit; end

  def update
    return render 'edit' unless @user.update(profile_params)

    send_home
  end

  private

  def profile_params
    params.require(:user).permit(
      profile_attributes: %i[bio likes dislikes gender sex_pref]
    )
  end

  def find_user_and_exit_unless_match
    return redirect_to '/' unless params[:user_id] == session[:id]

    @user = User.find_by(id: session[:id])
  end

  def send_home
    redirect_to user_path(@user)
  end
end
