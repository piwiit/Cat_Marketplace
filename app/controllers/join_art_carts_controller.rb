class JoinArtCartsController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @join_art_carts = JoinArtCart.all
    @cart_price = Cart.all
  end

  def show
    @join_art_carts = JoinArtCart.all
    @join_art_cart = JoinArtCart.find(params[:artwork_id])
  end

  def new
    @join_art_cart = JoinArtCart.new
  end

  def create
    artwork = Artwork.find(params[:artwork_id])
    @join_art_cart = @cart.join_art_carts.create(artwork_id: artwork.id)
    if @join_art_cart.save
      redirect_to cart_path(@cart)
      flash[:notice_good] = 'Join_art_cart ajouté !'
    else
      redirect_to join_art_carts_path
      flash[:notice_bad] = 'Join_art_cart non crée !'
    end
  end

  def edit
    @join_art_cart_to_edit = JoinArtCart.find(params[:id])
  end

  def update
    @join_art_cart_to_update = JoinArtCart.find(params[:id])
    join_art_cart_params =
      params.require(:join_art_cart).permit(:cart_id, :artwork_id, :quantity)
    @join_art_cart_to_update.update(join_art_cart_params)

    if @join_art_cart_to_update.update(join_art_cart_params)

    else

    end
  end

  def destroy
    @join_art_cart_to_delete = JoinArtCart.find(params[:id])
    @join_art_cart_to_delete.destroy
    redirect_to cart_path(@cart)
  end

  private

  def join_art_cart_params
    params.require(:join_art_cart).permit(:cart_id, :artwork_id, :quantity)
  end
end
