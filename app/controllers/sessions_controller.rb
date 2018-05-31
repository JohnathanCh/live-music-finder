class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def login

    @user = User.find_by(email: params[:email])

    if user.authenticate(params[:password])
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

end

# if session[:user_id] == nil || params[:user][:id].empty?
#
#   redirect_to login_path
# else
#
#   #redirect_to homepage
# end
