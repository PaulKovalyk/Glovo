# frozen_string_literal: true

class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: %i[show destroy]
  def show
    @order = Order.new
  end

  def index
    @carts = Cart.all
    @restaurants = Restaurant.all
  end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    flash[:success] = 'Now you cart is empty'
    redirect_to root_path
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to root_url, notice: 'Invalid cart'
  end
end
