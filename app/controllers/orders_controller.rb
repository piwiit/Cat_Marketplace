class OrdersController < ApplicationController
  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(reception_email: params[:reception_email], total_price: params[:total_price], cart_id: params[:cart_id])
    if @order.save
      redirect_to root_path
      flash[:notice_good] = "Paiement validé!"
    else
      flash[:notice_bad] = "Paiement refusé!"
      render 'new'
    end
  end

  def edit
    @order_to_edit = order.find(params[:id])
  end

  def update
    @order_to_edit = order.find(params[:id])
    post_params = params.require(:order).permit(:reception_email, :total_price, :cart_id)
    @order_to_edit.update(post_params)
    redirect_to root_path
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to root_path
  end

end
