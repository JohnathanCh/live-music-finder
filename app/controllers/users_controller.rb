class UsersController < ApplicationController



  def show

  end

#Sign up a new user
  def new

  end

#creates a new user
  def create
      session[:name] = params[:name]

      if session[:name] == nil || session[:name].empty?

        redirect_to login_path
      else

        redirect_to user_path
      end
  end

#logout the user
  def destroy
    session[:name] = params[:name]

    if session[:name] == nil || params[:name].empty?

      redirect_to login_path
    else

      session.delete :name
    end
  end

  private

  def require_login
    return head(:forbidden) unless session.include? :name
  end
end
