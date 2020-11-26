class ChargesController < ApplicationController
  def new
    @cart = Cart.find_by(user_id: current_user.id)
  end

  def create
    @cart = Cart.find_by(user_id: current_user.id)

    @customer =
      Stripe::Customer.create(
        { email: params[:stripeEmail], source: params[:stripeToken] }
      )

    @charge =
      Stripe::Charge.create(
        {
          customer: @customer.id,
          amount: (@cart.total * 100).to_i,
          description: 'Rails Stripe customer',
          currency: 'eur'
        }
      )
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_cart_charge_path(@cart.id)
  end # Amount in cents


end
