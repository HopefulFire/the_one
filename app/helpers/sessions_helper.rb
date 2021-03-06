module SessionsHelper
  def logged_in?
    session[:id] && User.find_by(id: session[:id])
  end

  def current_user
    User.find_by(id: session[:id])
  end
end
