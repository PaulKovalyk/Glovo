# frozen_string_literal: true

class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.nil? || !@user.owner?
        scope.all
      else
        @user.owner?
        scope.where(user_id: @user.id)
      end
    end
  end

  def show?
    @user.owner?
  end

  def create?
    @user.owner?
  end

  def update?
    @user.owner?
  end
end
