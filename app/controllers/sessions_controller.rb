class SessionsController < ApplicationController
  def new; end

  def create
    provider = authorize_params['provider']
    uid = authorize_params['uid']
    info = authorize_params['info']
    user = User.find_or_create_by(uid: uid, provider: provider) do |user|
      case provider
      when 'google_oauth2'
        user.name = info['name']
        user.firstname = info['first_name']
        user.lastname = info['last_name']
        user.email = info['email']
      end
      user.uid = uid
      user.provider = provider
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
