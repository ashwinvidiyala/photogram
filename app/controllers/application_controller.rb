class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  helper_method :current_user

  def current_user
    User.find(session[:user_id]) if session.key?(:user_id)
  end

  def require_login
   redirect_to login_path unless current_user
 end

end
