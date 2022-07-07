# frozen_string_literal: true

class DishesController < ApplicationController
  before_action :dish_params, only: %i[create update index]
  before_action :set_restaurant!, only: %i[create destroy update index]

  def index
    @dishes_by_category = if params[:category]
                            @restaurant.dishes.where(category: params[:category])
                          else
                            @restaurant.dishes
                          end
  end

  def update
    if @dish.update(dish_params)
      flash[:success] = 'Dish updated!' # rubocop:disable Rails/I18nLocaleTexts: Move locale texts to the locale files in the config/locales directory.
      redirect_to restaurant_path(@restaurant)
    else
      @dishes = Dish.order created_at: :desc
      render 'restaurants/show'
    end
  end

  def create
    @dish = @restaurant.dishes.build(dish_params)

    if @dish.save
      flash[:success] = 'Dish created!' # rubocop:disable Rails/I18nLocaleTexts: Move locale texts to the locale files in the config/locales directory.
      redirect_to restaurant_path(@restaurant)
    else
      @dishes = Dish.order(created_at: :desc)
      render 'restaurants/show'
    end
  end

  def destroy
    dish = @restaurant.dishes.find params[:id]
    dish.destroy
    flash[:success] = 'Dish deleted' # rubocop:disable Rails/I18nLocaleTexts: Move locale texts to the locale files in the config/locales directory.
    redirect_to restaurant_path(@restaurant)
  end

  private

  def dish_params
    params.permit(:name, :price, :weight, :category, :restaurant_id)
  end

  def set_restaurant!
    @restaurant = Restaurant.find params[:restaurant_id]
  end
end
