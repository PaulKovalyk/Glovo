# frozen_string_literal: true

class LineItemPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def create?
    !@user.owner?
  end

  def new?
    create?
  end

  def destroy?
    !@user.owner?
  end
end
