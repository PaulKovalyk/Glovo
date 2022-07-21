class RestaurantPolicy < ApplicationPolicy
    def resolve
      if user.admin?
        scope.where(:)
      else
        scope.all
      end
    end
end