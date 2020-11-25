class ArtworksController < ApplicationController # verifier les REDIRECT # gerer Activerecord pour creation et update d'artwork # PRECISER les bon params, ajouter aguilleur AJAX, et les redirect du NEW et UPDATE
  def index
    @artworks = Artwork.all
  end

  def show
    @artworks = Artwork.all
    @artwork = Artwork.find(params[:id])
  end

  def new
    @artwork = Artwork.new
    @artworks = Artwork.all

  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      redirect_to artworks_path
      flash[:notice_good] = 'Artwork ajouté !'
    else
      redirect_to artworks_path
      flash[:notice_bad] = 'Artwork non crée !'
    end
  end

  def edit
    @artwork_to_edit = Artwork.find(params[:id])
  end

  def update
    @artwork_to_update = Artwork.find(params[:id])
    artwork_params =
      params.require(:artwork).permit(
        :title,
        :price,
        :description,
        :category_id
      )
    @artwork_to_update.update(artwork_params)

    if @artwork_to_update.update(artwork_params)

    else

    end
  end

  def destroy
    @artwork_to_delete = Artwork.find(params[:id])
    @artwork_to_delete.destroy
    redirect_to root_path
  end

private

  def artwork_params
    params.require(:artwork).permit(:title, :description, :price, :category_id, :picture)
  end

end
