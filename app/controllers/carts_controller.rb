class CartsController < ApplicationController
  before_action :set_cart, only: %i[show edit update destroy] # verifier les REDIRECT
  def index
    @carts = Cart.all
  end

  def show; end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to root_path
      flash[:notice_good] = 'Panier crée !'
    else
      flash[:notice_bad] = 'Panier non crée'
      render 'new'
    end
  end

  def edit; end

  def update; end

  def destroy
    @cart_to_delete = Cart.find(params[:id])
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(:user_id)
  end

  def total
    total = 0
    self.line_items.each do |line_item|
        total += line_item.product.price
    end
    return total
end
end
