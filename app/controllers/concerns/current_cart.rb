# frozen_string_literal: true

module CurrentCart
  extend ActiveSupport::Concern

  private

  def set_cart
    
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    @cart.update(user_id: current_user.id)
    session[:cart_id] = @cart.id
    
  end
end
