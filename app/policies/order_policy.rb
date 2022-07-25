class OrderPolicy < ApplicationPolicy
  class Scope < Scope
      def resolve
        if @user.owner?
          scope.where(line_items: @user.restaurants.map{|r| r.dishes.pluck(:id) }.flatten )
        elsif !@user.owner?
          scope.all
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
