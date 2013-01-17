require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase 
  
  test "update from omniauth updates employee" do 
    email = 'example@cyrusinnovation.com'
    Employee.create!(:email => email)
    opts = {:email => email, :provider => 'google', :uid => 'abc123'}
    Employee.update_from_omniauth(opts)
    actual = Employee.find_by_email(email)
    assert_equal(email, actual.email)
    assert_equal('google', actual.provider)
    assert_equal('abc123', actual.uid)
  end

  test "update from omniauth with invalid email" do 
    opts = {:email => 'foo@cyrusinnovation.com', :provider => 'google', :uid => 'abc123'}
    actual = Employee.update_from_omniauth(opts)
    assert_nil(actual)
  end

  test "completed expense with associated statement" do 
    expense = expense_with_complete_status(true)
    emp = employee_with_expense(expense)
    statement = statement_with_expense(expense)
    assert emp.statement_complete?(statement), "Expected statement to be complete"
  end

  test "expense is not complete" do 
    expense = expense_with_complete_status(false)
    emp = employee_with_expense(expense)
    statement = statement_with_expense(expense)
    refute emp.statement_complete?(statement), "Expected statement to be incomplete"
  end

  test "no expenses are associated with statement" do 
    expense = expense_with_complete_status(true)
    emp = employee_with_expense(expense)
    statement = Statement.create!
    refute emp.statement_complete?(statement), "Expected statement to be incomplete"
  end

  private 
  
  def employee_with_expense(expense)
    Employee.create!.tap do |e|
      e.expenses << expense 
      e.save
    end
  end

  def statement_with_expense(expense)
    Statement.create!.tap do |s|
      s.expenses << expense
      s.save
    end
  end

  def expense_with_complete_status(completeness)
    Expense.create!.tap do |e|
      e.complete = completeness
      e.save
    end
  end
end
