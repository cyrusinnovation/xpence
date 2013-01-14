class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= Employee.new
    if user.admin?
      can :manage, :all
    else
      can [:read,:update,:reset], Expense, :employee_id => user.id
      can [:read, :update], Employee, :id => user.id
      cannot [:create], Employee
      cannot [:edit], Expense
    end
  end
end