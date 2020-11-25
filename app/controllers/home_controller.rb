class HomeController < ApplicationController
  def index
    @artwork = Artwork.all
    @promotion = Artwork.last
    @artworks_last = Artwork.all.sort_by {|m| m.created_at }
  end
end
