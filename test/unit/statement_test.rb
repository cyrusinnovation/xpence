require 'test_helper'

class StatementTest < ActiveSupport::TestCase
  
  test "complete? returns true if all expenses are complete" do 
    expense = expense_with_complete_status(true)
    statement = statement_with_expense(expense)
    assert statement.complete?, "Expected statement to be complete"
  end

  test "complete? returns false if all expenses are not complete" do 
    expense = expense_with_complete_status(false)
    statement = statement_with_expense(expense)
    refute statement.complete?, "Expected statement to be incomplete"
  end

  test "calculates the sum of expenses" do 
    expenses = [
      Expense.create!(:amount => 10.73),
      Expense.create!(:amount => 20.16)
    ]
    statement = statement_with_expense(expenses)
    assert_equal 30.89, statement.total_expenses
  end

  test "#employees_with_incomplete" do 
    expense_complete = expense_with_complete_status(true)
    expense_incomplete = expense_with_complete_status(false) 

    statement = statement_with_expense([expense_complete, expense_incomplete])

    employees = [
      employee_with_expense(expense_complete),
      employee_with_expense(expense_incomplete)
    ]

    assert statement.employees_with_incomplete.include?(employees.last)
    refute statement.employees_with_incomplete.include?(employees.first)
  end

end
