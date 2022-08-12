# frozen_string_literal: true

class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.owner?
        dishes_ids = @user.restaurants.map { |r| r.dishes.pluck(:id) }.flatten
        scope.where(id: LineItem.where(dish_id: dishes_ids).select(:order_id))
      else
        scope.where(user_id: @user.id)
      end
    end
  end

  def create?
    !@user.owner?
  end

  def index?
    !@user.nil?
  end

  def destroy?
    !@user.nil?
  end

  def update?
    !@user.nil?
  end
end
