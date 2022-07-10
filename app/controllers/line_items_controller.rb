# frozen_string_literal: true

class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: %i[ show edit update destroy ]

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

  end

  private

  def line_items_params
    params.require(:line_item).permit(:dish_id)
  end
end
