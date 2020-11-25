class CartsController < ApplicationController

    # PRECISER les bon params, ajouter aguilleur AJAX, et les redirect du NEW et UPDATE
  # verifier les REDIRECT
  def index
    @carts = Cart.all
  end
  
  # def show
  #   @cart = Cart.find(params[:id])

  # end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(is_archived: params[:is_archived], user: session[:user_id])
  if @cart.save
    redirect_to root_path
    flash[:notice_good] = "Panier crée !"
  else
    
    flash[:notice_bad] = "Panier non crée"
    render 'new'

  end
  end

  def edit
  end

  def update
  end

   def destroy
  @cart_to_delete = Cart.find(params[:id])
  end
  
end
