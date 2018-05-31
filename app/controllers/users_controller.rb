class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
  end

#Sign up a new user
  def new
    @user = User.new

  end

#creates a new user
  def create
    # byebug
      @user = User.new(user_params)

      if @user.valid?
        @user.save
        session[:user_id] = @user.id
        
        redirect_to @user
      else

        render :new
      end
  end

#   def login
#     session[:user_id] = params[:user][:id]
#
#     if session[:user_id] == nil || params[:user][:id].empty?
#
#       redirect_to login_path
#     else
#
#       #redirect_to homepage
#     end
#
#   end
#
# #logout the user
#   def logout
#     session.delete :user_id
#   end

  private

  def require_login
    return head(:forbidden) unless session.include? :name
  end

  def user_params
    params.require(:user).permit(:name, :email, :age)
  end
end
