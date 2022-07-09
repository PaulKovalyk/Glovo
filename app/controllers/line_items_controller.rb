# frozen_string_literal: true

class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]

  def create
    dish = Dish.find(params[:dish_id])

    @line_item = @cart.add_product(dish.id)



    if @line_item.save
      flash[:success] = 'Line item was successfully created'
      redirect_to @line_item.cart
    else
      redirect_to root_path
    end
  end
end
