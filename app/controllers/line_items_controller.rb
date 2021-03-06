# frozen_string_literal: true

class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]

  def create
    dish = Dish.find(params[:dish_id])

    @line_item = @cart.add_product(dish.id)

    if @line_item.save
      redirect_to @line_item.cart
    else
      redirect_to root_path
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to(@line_item.cart)
  end

  private

  def line_items_params
    params.require(:line_item).permit(:dish_id)
  end
end
