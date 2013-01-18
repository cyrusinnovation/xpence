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



end
