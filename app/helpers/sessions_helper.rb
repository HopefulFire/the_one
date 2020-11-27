module SessionsHelper
  def logged_in?
    !!session[:id]
  end

  def session_user
    User.find_by(id: session[:id])
  end
end
