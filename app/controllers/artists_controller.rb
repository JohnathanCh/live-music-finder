class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @events = @artist.events
  end

  def search
    
  end
end
