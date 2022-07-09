class CartsController < ApplicationController
 
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def show
    @cart = Cart.find(params[:id])
    
  end
  def index
    @carts = Cart.all
    @restaurants = Restaurant.all
  end

  private

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to root_url, notice: 'Invalid cart'
  end
end
