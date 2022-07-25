# frozen_string_literal: true

class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.nil?
        scope.all
      elsif !@user.owner?
        scope.all
      elsif @user.owner?
        scope.where(user_id: @user.id)
      end
    end
  end

  def create?
    @user.owner?
  end

  def new?
    create?
  end

  def update?
    @user.owner?
  end

  def edit?
    update?
  end
end
