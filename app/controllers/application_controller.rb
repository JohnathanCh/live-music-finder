class ApplicationController < ActionController::Base
  helper_method :require_login, :current_user, :logged_in?

  def require_login
    redirect_to signup_path unless session.include? :name
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user])
  end

   def logged_in?
     current_user != nil
   end
end
