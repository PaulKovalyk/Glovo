# frozen_string_literal: true

class DishesController < ApplicationController
  before_action :dish_params, only: %i[create index]
  before_action :set_restaurant!, only: %i[create index new]

  def index
    if params[:category]
      @dishes_by_category = @restaurant.dishes.where(category: params[:category])
    else
      @dishes_by_category=@restaurant.dishes
   end
  end

  def create
    @dish = @restaurant.dishes.build(dish_params)

    if @dish.save
      flash[:success] = 'Dish created!'
      redirect_to restaurant_path(@restaurant)
    else
      @dishes = Dish.order(created_at: :desc)
      render 'restaurants/show'
    end
  end

  private

  def dish_params
    params.permit(:name, :price, :weight, :category, :restaurant_id)
  end

  def set_restaurant!
    @restaurant = Restaurant.find params[:restaurant_id]
  end
end
