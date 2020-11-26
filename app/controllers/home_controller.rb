class HomeController < ApplicationController
  def index
    @artwork = Artwork.all
    @promotion = Artwork.last
    @artworks_last = Artwork.all.sort_by {|m| m.created_at }
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Nous n'avez pas de panier."
    redirect_to action: :index
  end
end
