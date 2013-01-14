class AdminController < ApplicationController
  
  before_filter :is_admin?

  def dashboard
    # debugger
    @employees = Employee.all
    @statements = Statement.all
  end

  private

  def is_admin?
    unless current_user.admin?
      redirect_to named_employee_expenses_path(current_user.name), :notice => 'MUST BE ADMIN' 
    end 
  end
end
