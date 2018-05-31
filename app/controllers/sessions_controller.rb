class SessionsController < ApplicationController

  def new

  end

  def login

    user = User.find_by(name: params[:name])

    if user.authenticate(params[:password])
      session[:user_id] = user.id

      #redirect_to somewhere
    else

      render 'sessions/new'
    end



  end

#logout the user
  def logout
    session.delete :user_id
  end

end

# if session[:user_id] == nil || params[:user][:id].empty?
#
#   redirect_to login_path
# else
#
#   #redirect_to homepage
# end
