class SessionsController < ApplicationController
  skip_before_filter :require_login, :only => :create

  def create
    auth = request.env["omniauth.auth"]
    employee = Employee.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Employee.update_from_omniauth(:provider => auth["provider"],
                                                                                                                  :uid => auth["uid"],
                                                                                                                  :email =>auth["info"]["email"])
    session[:employee_id] = employee.id
    if employee.admin?
      redirect_to params[:referrer] || admin_dashboard_path
    else
      redirect_to params[:referrer] || named_employee_expenses_path(employee.name) 
    end
  end

  def destroy
    session[:employee_id] = nil
    redirect_to root_path
  end
end
