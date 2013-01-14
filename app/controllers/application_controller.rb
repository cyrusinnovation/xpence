class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

  before_filter :choose_layout

  helper_method :current_user

  

  private

  #COMMENTED OUT ON 1/7/13 - REMOVE IF NO CHANGE BY 2/7/13
  # def current_employee
  #   @current_employee || Employee.find(session[:employee_id]) if session[:employee_id]
  # end

  def current_user
    @current_user || Employee.find(session[:employee_id]) if session[:employee_id]
  end

  def require_login
    unless logged_in?
      redirect_to authorization_path(:referrer => request.env["REQUEST_URI"])
    end
  end

  def choose_layout
    if current_user && current_user.admin?
      self.class.send(:layout, 'admin') 
    end
  end

  def logged_in?
    true if current_user
  end
end
