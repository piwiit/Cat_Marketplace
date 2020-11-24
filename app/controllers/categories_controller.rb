class CategoriesController < ApplicationController
  def new
@category = Categories.new
  end


  def create
  @category.new = Categories.new(name: params[:name])
  if @category.save
    redirect_back(fallback_location: root_path)    # IMPORTANT ! Permet de revenir a la page de base
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

  end
end
