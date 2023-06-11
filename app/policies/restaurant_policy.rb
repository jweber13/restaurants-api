class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    # Only restaurant owners can update it.
    # record (in this case, the restaurant)
    # user
    record.user == user
  end

  def create?
    # Anyone logged in user can create a restaurant.
    !user.nil?
  end

  def destroy?
    update? # don't need to copy/paste the logic
  end
end
