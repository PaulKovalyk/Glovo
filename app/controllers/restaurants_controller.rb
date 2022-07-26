# frozen_string_literal: true

class RestaurantsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]

  before_action :set_restaurant, only: %i[show edit update]
  before_action :fetch_tags, only: %i[new edit]
  def index
    @restaurants = policy_scope(Restaurant).order(created_at: :desc)
  end

  def new
    @restaurant = Restaurant.new
  end

  def show; end

  def create
    authorize Restaurant
    @restaurant = current_user.restaurants.build(restaurant_params)
    if @restaurant.save!
      flash[:success] = 'Restaurant created'
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    authorize Restaurant
    return if @restaurant.user_id == current_user.id

    redirect_to root_path
    flash[:danger] = 'Wrong restaurant'
  end

  def update
    authorize Restaurant
    if @restaurant.update restaurant_params
      flash[:success] = 'Restaurant updated'
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address, tag_ids: [])
  end

  def set_restaurant
    @restaurant = Restaurant.find params[:id]
  end

  def fetch_tags
    @tags = Tag.all
  end
end
