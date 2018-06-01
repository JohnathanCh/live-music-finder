class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @artists = @event.artists
  end

  def search
    
  end
end
