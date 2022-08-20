# frozen_string_literal: true

class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: %i[create index]
  before_action :set_order, only: %i[edit update destroy]
  before_action :set_restaurant, only: %i[edit update]

  def index
    authorize Order
    @orders = policy_scope(Order).order(created_at: :desc)
  end

  def create
    authorize Order
    @order = current_user.orders.new(order_params)
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
    authorize @order
    if current_user.owner?
      @order.destroy
      flash[:success] = 'Your order deleted'
    elsif @order.ordered_recently?
      @order.destroy
      redirect_to orders_path
      flash[:success] = 'Your order deleted'
    elsif redirect_to orders_path
      flash[:danger] = 'The order cannot be canceled'
    end
  end

  def edit
    authorize @order
  end

  def update
    authorize @order
    if @order.update order_params
      flash[:success] = 'Order updated'
    else
      flash[:danger] = 'The order cannot be updated'
    end
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :email, :created_at, :mark)
  end

  def set_restaurant
    dishes = @order.line_items.map(&:dish)
    @restaurant = dishes.map(&:restaurant)
  end

  def set_order
    @order = Order.find params[:id]
  end
end
