class EmployeeMailer < ActionMailer::Base
  helper :application
  default from: "rsmith@cyrusinnovation.com"

  def reminder_email(options={})
    @employee = options[:employee]
    @statement = options[:statement]
    @expenses = @statement.expenses.where('employee_id = ?', @employee.id)
    mail(:to => options[:employee].email, :subject => "Amex Reminder for Statement Ending #{@statement.closingdate}")
  end
end
