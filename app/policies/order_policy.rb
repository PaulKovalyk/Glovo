# frozen_string_literal: true

class OrderPolicy < ApplicationPolicy
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
