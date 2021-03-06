class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user
  before_action :require_login

  def current_user
    # @user ||= User.find(session[:user_id])
    User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  private

  def require_login
    redirect_to login_path unless logged_in?
  end

end
