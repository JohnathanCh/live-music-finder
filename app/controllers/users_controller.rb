class UsersController < ApplicationController
  skip_before_action :require_login, :only => [:new, :create]

  def show
    @user = User.find(params[:id])
    @events = @user.events

    @artists = @user.event_artists
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

  def add_event

    event = Event.find(params[:event_id])
    current_user.events << event

    redirect_to user_path(current_user)
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :age, :password)
  end
end
