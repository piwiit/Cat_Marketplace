class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @artworks_all = Artwork.all
    @artworks = @category.artworks
    @categories = Category.all
  end

  def new
@category = Categories.new
  end


  def create
  @category.new = Categories.new(name: params[:name])
  if @category.save
    redirect_back(fallback_location: root_path)    # IMPORTANT ! Permet de revenir a la page de base A VOIR SI çA MARCHE !!!
flash[:notice_good] = "Category Crée"
  else 
    flash[:notice_bad] = "Creation avortée"
    render 'new'
    end 
  end


  def edit
@category_edit = Categories.find(params[:id])
  end

#Pouvoir changer le nom d'une categorie. Par exemple spiderman => Ultimate Spiderman
  def update
@category = Categories.find(params[:id])
category_params = params.require(:category).permit(:name)
@category.update


end


# chris : lorsqu'on detruit une categorie, comment reagissent les artworks ?
  def destroy

  end
end
