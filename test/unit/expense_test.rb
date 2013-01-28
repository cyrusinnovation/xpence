require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  
  test "#reset sets all non-protected attributes to nil" do 
    expense = Expense.create!(
                              :date => Date.today,
                              :amount => 10,
                              :vendor => 'McDonalds',
                              :description => 'Professional Development',
                              :receipt_sent => 'Email'
                              )
    employee = employee_with_expense(expense)
    expense.reset
    assert_nil expense.description
    assert_nil expense.receipt_sent
    assert_not_nil expense.vendor
    assert_not_nil expense.id
    assert_equal expense.date, Date.today
    assert_equal expense.employee, employee
  end

end
