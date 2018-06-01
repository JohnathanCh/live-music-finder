class StaticController < ApplicationController
skip_before_action :require_login

#root welcome page
def welcome

end

#show stats about our app
def stats
  @most_users = Event.most_users

end


end
