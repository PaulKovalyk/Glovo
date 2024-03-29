# frozen_string_literal: true

class LineItemPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def create?
    !@user.owner?
  end

  def destroy?
    !@user.nil?
  end
end
