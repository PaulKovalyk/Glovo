# frozen_string_literal: true

class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :authenticate_user!
  def create
    dish = Dish.find(params[:dish_id])
    @line_item = @cart.add_product(dish.id)
    
    
    if @cart.line_items.first.dish.restaurant_id == @line_item.dish.restaurant_id
      @line_item.save
      redirect_to @line_item.cart
    else
      flash[:success] = 'You cant order from other restaurant'
      redirect_to root_path
    end
  end

  def destroy
     
   
   
    @line_item = LineItem.find(params[:id])
    authorize @line_item
    @line_item.destroy
    redirect_to(orders_path)
  end

  private

  def line_items_params
    params.require(:line_item).permit(:dish_id)
  end

end
