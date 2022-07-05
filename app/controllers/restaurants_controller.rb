class RestaurantsController < ApplicationController
    before_action :set_restaurant, only: %i[show destroy edit update]
    before_action :fetch_tags, only: %i[new edit]
    
    def index
        @restaurants = Restaurant.order(created_at: :desc )
    end
    def new
        @restaurant = Restaurant.new
    end
    
    def show
        
    end

    def create
       
        @restaurant = Restaurant.new restaurant_params
            if @restaurant.save!
                flash[:success] = "Restaurant created!"
            redirect_to root_path
            else
                render :new
        end
    end

    private

    def restaurant_params
       params.require(:restaurant).permit(:name,:description,:address,:image_url, tag_ids:[])         
    end

    def set_restaurant
        @restaurant= Restaurant.find params[:id]
    end

    def fetch_tags
        @tags = Tag.all
    end
end