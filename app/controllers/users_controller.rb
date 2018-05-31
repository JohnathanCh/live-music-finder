class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

#Sign up a new user
  def new
    @user = User.new
  end

#creates a new user
  def signup
    # byebug
      @user = User.new(user_params)

      if @user.valid?
        @user.save

        redirect_to @user
      else

        render :new
      end
  end

  def login

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

  def user_params
    params.require(:user).permit(:name, :email, :age)
  end
end
