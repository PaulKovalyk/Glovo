class DishPolicy < ApplicationPolicy
      def index?
        true
      end
    
      def create?
        @user.owner?
      end
    
      def new?
        create?
      end

end
  