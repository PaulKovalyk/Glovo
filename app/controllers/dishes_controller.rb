class DishesController < ApplicationController
    
    before_action :dish_params, only: %i[ create update index]
    before_action :set_restaurant!, only: %i[ create destroy edit update new index]
    def show

    end
    def new

    end
    def edit
        
    end
    def index
     
    end
    def update
        if @dish.update(dish_params)
            flash[:success] = "Dish updated!"
            redirect_to restaurant_path(@restaurant)
        else
            @dishes = Dish.order created_at: :desc
            render 'restaurants/show'
        end
    end
    def create
       
        @dish = @restaurant.dishes.build(dish_params)

        if @dish.save
            flash[:success] = "Dish created!"
            redirect_to restaurant_path(@restaurant)
        else
            @dishes = Dish.order(created_at: :desc)
            render 'restaurants/show'
        end

    end

    def destroy
        dish = @restaurant.dishes.find params[:id]
        dish.destroy
        flash[:success] = "Dish deleted"
        redirect_to restaurant_path(@restaurant)
    end
    private

    def dish_params
        params.permit(:name,:price,:weight,:status)         
    end

    def set_restaurant!
        @restaurant = Restaurant.find params[:restaurant_id]
    end
    
    
end