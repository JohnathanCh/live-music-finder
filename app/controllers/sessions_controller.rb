class SessionsController < ApplicationController
  skip_before_action :require_login, :only => [:new, :create]

#form for creating new user
  def new
    @user = User.new
  end

#post for creating a new user
  def create
    @user = User.find_by(email: user_params[:email])

    if @user != nil && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id

      redirect_to events_path
    else
      @user = User.new
      @user.valid?

      render 'new'
    end
  end

#logout the user
  def logout
    session.delete :user_id

    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)

  end

end

# if session[:user_id] == nil || params[:user][:id].empty?
#
#   redirect_to login_path
# else
#
#   #redirect_to homepage
# end
