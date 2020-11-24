class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

   def destroy
    @order_to_delete = Order.find(params[:id])
  end
  
end
