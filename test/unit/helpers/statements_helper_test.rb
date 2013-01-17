require 'test_helper'

class StatementsHelperTest < ActionView::TestCase

  test "should return incomplete if statement is not complete" do 
    expense = Expense.create!
    expense.complete = false
    expense.save
    employee = Employee.create!
    employee.expenses << expense
    employee.save
    statement = Statement.create!
    statement.expenses << expense
    statement.save
    actual = statement_status(statement, employee)
    assert_equal actual, "incomplete"
  end

  test "should return complete if statement is complete" do 
    expense = Expense.create!
    expense.complete = true
    expense.save
    employee = Employee.create!
    employee.expenses << expense
    employee.save
    statement = Statement.create!
    statement.expenses << expense
    statement.save
    actual = statement_status(statement, employee)
    assert_equal actual, "complete"
    
  end
end
