class SessionsController < ApplicationController
  skip_before_action :require_login, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create

    @user = User.find_by(email: user_params[:email])

    if @user.authenticate(user_params[:password])
      session[:user_id] = @user.id

      redirect_to events_path
    else

      render login_path
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
