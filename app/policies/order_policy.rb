# frozen_string_literal: true

class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.owner?
        dishes_ids = @user.restaurants.map { |r| r.dishes.pluck(:id)}.flatten
        scope.where(id: LineItem.where(dish_id: dishes_ids).pluck(:order_id))
      else
        scope.where(user_id: @user.id)
      end
    end
  end
  
  def create?
    !@user.owner?
  end

  def new?
    create?
  end

  def index?
    @user.owner? || !@user.owner?
  end

  def destroy?
    @user.owner? || !@user.owner?
  end
end
