# frozen_string_literal: true

class DishesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  before_action :set_restaurant, only: %i[new create index edit update]
  before_action :set_dish, only: %i[edit update]
  def new
    authorize Dish
    @dish = Dish.new
  end

  def index
    authorize Dish
    @dishes_by_category = if params[:category]
                            @restaurant.dishes.where(category: params[:category])
                          else
                            @restaurant.dishes
                          end
  end

  def edit
    authorize @dish
  end

  def update
    authorize @dish
    if @dish.update(dish_params_require)
      flash[:success] = 'Dish updated'
      redirect_to root_path
    else
      redirect_to edit_restaurant_dish_path
    end
  end

  def create
    authorize Dish
    @dish = @restaurant.dishes.build(dish_params)

    if @dish.save
      flash[:success] = 'Dish created!'
      redirect_to restaurant_dishes_path
    else
      flash[:danger] = @dish.errors.full_messages.join(', ')
      redirect_to new_restaurant_dish_path(@restaurant, @dish)
    end
  end

  private

  def dish_params_require
    params.require(:dish).permit(:name, :price, :weight, :category, :id, :restaurant_id)
  end

  def dish_params
    params.permit(:name, :price, :weight, :category, :id, :restaurant_id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_dish
    @dish = @restaurant.dishes.find(params[:id])
  end
end
