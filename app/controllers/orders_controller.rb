# frozen_string_literal: true

class OrdersController < ApplicationController
  include CurrentCart
  before_action :authenticate_user!
  before_action :set_cart, only: %i[new create index]

  def new
    authorize Order
    @order = Order.new
  end

  def index
    authorize Order
    @orders = Order.order(created_at: :desc)
    @line_items = LineItem.all
  end

  def create
    authorize Order
    @order = Order.create(order_params)
    if @order.save
      @order.add_line_items_from_cart(@cart)
      Cart.destroy(session[:cart_id])
      session[:card_id] = nil
      redirect_to root_path
      flash[:success] = 'Thank you for your order'
    else
      flash[:danger] = @order.errors.full_messages.join(', ')
      redirect_to cart_path(@cart)
    end
  end

  def destroy
    @order = Order.find(params[:id])
    authorize Order
    if @order.ordered_recently?

      @order.destroy
      redirect_to orders_path
      flash[:success] = 'Your order deleted'
    else
      redirect_to orders_path
      flash[:danger] = 'The order cannot be canceled'
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :email, :pay_type, :id, :created_at)
  end
end
