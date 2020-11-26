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
      redirect_back(fallback_location: root_path)   
      flash[:notice_good] = "Category Crée"
    else 
      flash[:notice_bad] = "Creation avortée"
      render 'new'
    end 
  end

  def edit
    @category_edit = Categories.find(params[:id])
  end

  def update
    @category = Categories.find(params[:id])
    category_params = params.require(:category).permit(:name)
    @category.update

    if @category.update(post_params)
      redirect_to root_path
      flash[:notice_good] = "Edition reussis !"
    else 
      redirect_to gossip_path(id)
      flash[:notice_bad] = "Probleme rencontré"
    end
  end


  def destroy
    @category = Categories.find(params[:id])
    @category.destroy
    redirect_to root_path
  end
end
