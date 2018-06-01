class StaticController < ApplicationController
  skip_before_action :require_login, only: :welcome

  def welcome

  end

  def search
    query = URI.decode_www_form_component(params[:q]).strip
    byebug

    @artists = Artist.search(query)
    @events = Event.search(query)
    @users = User.search(query)
  end

end
