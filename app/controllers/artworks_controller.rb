class ArtworksController < ApplicationController

  # PRECISER les bon params, ajouter aguilleur AJAX, et les redirect du NEW et UPDATE
  # gerer Activerecord pour creation et update d'artwork
  # verifier les REDIRECT

  def index
    @artworks = Artworks.all
  end
  
  def show
    @artworks = Artwork.all
    @artwork = Artworks.find(params[:id])
  end

  def new
  @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(title: params[:title],
                              price: params[:price],
                              description: params[:description],
                              category: params[:category])
    if @artwork.save
       redirect_to root_path
       flash[:notice_good] = "Artwork ajouté !"
     else
redirect_to path
flash[:notice_bad] = "Artwork non crée !"
end
  end

  def edit
    @artwork_to_edit = Artwork.find(params[:id])
  end

  def update
    @artwork_to_update = Artwork.find(params[:id])
    artwork_params = params.require(:artwork).permit(:title, :price, :description, :category)
    @artwork_to_update.update(artwork_params)

    if @artwork_to_update.update(artwork_params)

    else
    end

  end

   def destroy
    @artwork_to_delete = Artworks.find(params[:id])
    @artwork_to_delete.destroy
    redirect_to root_path
   end
  end

end
