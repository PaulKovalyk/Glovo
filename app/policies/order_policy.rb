# frozen_string_literal: true

class OrderPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def create?
    !@user.owner?
  end

  def new?
    create?
  end
end
