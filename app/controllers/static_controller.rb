class StaticController < ApplicationController
  skip_before_action :require_login, only: [:welcome]

  #root welcome page
  def welcome

  end

  def search
    query = URI.decode_www_form_component(params[:q]).strip
    byebug

    @artists = Artist.search(query)
    @events = Event.search(query)
    @users = User.search(query)
  end

#show stats about our app
def stats
  @most_users = Event.most_users

end


end
