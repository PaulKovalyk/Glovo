# frozen_string_literal: true
class OrdersController < ApplicationController
    include CurrentCart
    before_action :set_cart, only: %i[new create]
    before_action :set_order,only: %i[show]
    before_action :set_dish,only: %i[show]
    before_action :set_restaurant,only: %i[show]
    def new
         @order = Order.new
    end

    def show

    end

    def create
        @order = Order.create(order_params)
            if @order.save
                @order.add_line_items_from_cart(@cart)
                Cart.destroy(session[:cart_id])
                session[:card_id]=nil
                redirect_to root_path
                flash[:success] = 'Thank you for your order'
            else 
                render :new
            end
    end
    private
   
    def set_dish
        @dish = Dish.find(params[:id])
    end

    def set_order
        @order = Order.find(params[:id])
      end

    def order_params
        params.require(:order).permit(:name, :address, :email, :pay_type)
    end

    def set_restaurant
        @restaurant = Restaurant.find(params[:id])
    end
end
