class CartsController < ApplicationController
 
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def show
    @cart = Cart.find(params[:id])
    
  end
  def index
    @carts = Cart.all
    @restaurants = Restaurant.all
  end
  def destroy
    @cart = Cart.find(params[:id])

    @cart.destroy if @cart.id == session[:cart_id]
      flash[:success] = 'Now you cart is empty'
      redirect_to root_path
   
    
  end

  private

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to root_url, notice: 'Invalid cart'
  end
end
