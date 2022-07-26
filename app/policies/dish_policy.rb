# frozen_string_literal: true

class DishPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    @user.owner?
  end

  def update?
    @user.owner?
  end
end
