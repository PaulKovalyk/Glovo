# frozen_string_literal: true

class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: %i[new create index]
  before_action :set_order, only: %i[create]

  def new
    @order = Order.new
  end

  def show; end

  def index
    @orders = Order.order(created_at: :desc)
    @line_items = LineItem.all
  end

  def create
    if @order.save
      @order.add_line_items_from_cart(@cart)
      Cart.destroy(session[:cart_id])
      session[:card_id] = nil
      redirect_to root_path
      flash[:success] = 'Thank you for your order'
    else
      redirect_to root_path
      flash[:danger] = 'Something going wrong'
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :email, :pay_type, :id)
  end

  def set_order
    @order = Order.create(order_params)
  end
end
