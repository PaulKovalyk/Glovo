# frozen_string_literal: true

class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]

  def create
    dish = Dish.find(params[:dish_id])

    @line_item = @cart.line_items.build(dish: dish)

    if @line_item.save
      flash[:success] = 'Line item was successfully created'
      redirect_to root_path
    else
      redirect_to
    end
  end
end
