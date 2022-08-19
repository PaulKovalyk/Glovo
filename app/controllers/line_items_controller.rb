# frozen_string_literal: true
class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create, :destroy]
  before_action :set_restaurant, only: [:destroy]
  def create
    authorize LineItem
    dish = Dish.find(params[:dish_id])
    @line_item = @cart.add_product(dish.id)

    if @cart.line_items.first.dish.restaurant_id == @line_item.dish.restaurant_id
     
      @line_item.save
      @restaurant = @line_item.dish.restaurant_id
      flash[:success] = "#{@line_item.quantity} x #{@line_item.dish.name} added to your order"
      redirect_to restaurant_dishes_path(@restaurant)
    else
      flash[:success] = 'You cant order from other restaurant'
      redirect_to root_path
    end
  end

  def destroy
    authorize @line_item
    if @line_item.quantity >1
        @line_item.update(quantity: @line_item.quantity-1)
        redirect_back(fallback_location: root_path)
    else
      @line_item.destroy
        if current_user.owner?
          redirect_to restaurant_path(@restaurant)
        else
          redirect_to @line_item.cart
        end
    end
    flash[:success] = 'Dish deleted'
  end

  
  private

  def line_items_params
    params.require(:line_item).permit(:dish_id)
  end

  def set_restaurant
    @line_item = LineItem.find(params[:id])
    @restaurant = @line_item.dish.restaurant_id
  end
end
