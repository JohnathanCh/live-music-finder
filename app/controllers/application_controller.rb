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

  def search(query)
    #artists controller search
    #events controller search
    #users controller search
  end

  private

  def require_login
    redirect_to login_path unless logged_in?
  end

end
