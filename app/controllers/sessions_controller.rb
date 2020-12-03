class SessionsController < ApplicationController
  def new; end

  def create
    provider = authorize_params['provider']
    uid = authorize_params['uid']
    info = authorize_params['info']
    user = User.find_or_create_by(uid: uid, provider: provider) do |user|
      user.email = info['email']
      case provider
      when 'google_oauth2'
        user.nickname = info['nickname']
        user.firstname = info['first_name']
        user.lastname = info['last_name']
        user.nickname = "#{user.firstname} #{user.lastname}" unless user.nickname
      end
    end
    redirect_to "/auth/#{provider}" unless user.valid?
    session[:id] = user.id
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def authorize_params
    request.env['omniauth.auth']
  end
end
