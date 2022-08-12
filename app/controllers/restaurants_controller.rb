# frozen_string_literal: true

class RestaurantsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_restaurant
  skip_before_action :authenticate_user!, only: %i[index]
  before_action :set_restaurant, only: %i[show edit update]
  before_action :fetch_tags, only: %i[new edit]
  def index
    @restaurants = policy_scope(Restaurant).order(created_at: :desc)
  end

  def new
    authorize Restaurant
    @restaurant = Restaurant.new
  end

  def show
    @rest = policy_scope(Restaurant).find_by(id: params[:id])
    if @rest.nil?
      redirect_to root_path
    else
      @line_items = @rest.dishes.map(&:line_items).flatten
      @orders = if params[:mark] == 'active'

                  Order.active.where(id: @line_items.map(&:order_id))
                else
                  Order.completed.where(id: @line_items.map(&:order_id))
                end
    end
  end

  def create
    authorize Restaurant
    @restaurant = current_user.restaurants.build(restaurant_params)
    if @restaurant.save
      flash[:success] = 'Restaurant created'
      redirect_to root_path
    else
      flash[:danger] = @restaurant.errors.full_messages.join(', ')
      redirect_to new_restaurant_path
    end
  end

  def edit
    authorize @restaurant
    nil
  end

  def update
    authorize @restaurant
    if @restaurant.update restaurant_params
      flash[:success] = 'Restaurant updated'
      redirect_to root_path
    else
      redirect_to edit_restaurant_path
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address, tag_ids: [])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def fetch_tags
    @tags = Tag.all
  end

  def invalid_restaurant
    logger.error "Attempt to access invalid restaurant #{params[:id]}"
    redirect_to root_url, notice: 'Invalid restaurant'
  end
end
