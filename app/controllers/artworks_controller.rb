class ArtworksController < ApplicationController
  before_action :set_artwork, only: %i[show edit update destroy]

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)

    respond_to do |format|
      if @artwork.save
        format.html do
          redirect_to @artwork, notice: 'Artwork was successfully created.'
        end
        format.json { render :show, status: :created, location: @artwork }
      else
        format.html { render :new }
        format.json do
          render json: @artwork.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @artwork.update(artwork_params)
        format.html do
          redirect_to @artwork, notice: 'Artwork was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @artwork }
      else
        format.html { render :edit }
        format.json do
          render json: @artwork.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def show; end

  def index
    @artworks = Artwork.all
  end

  def destroy
    @artwork.destroy
    respond_to do |format|
      format.html do
        redirect_to artwork_params,
                    notice: 'Artwork was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private # Use callbacks to share common setup or constraints between actions.
  def set_artwork
    @artwork = Artwork.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def artwork_params
    @category = Category.all
    params.require(:artwork).permit(
      :title,
      :description,
      :price,
      :image,
      :categorie
    )
  end
end
