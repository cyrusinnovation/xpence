require 'test_helper'

class ExpenseParserTest < ActiveSupport::TestCase
  setup do 
    @statement = Statement.new
    @row = ["10/09/2012  Tue", nil, "AMEX TRAVEL PURCHASE WITH MR POINTS CREDIT", "BRUCE ECKFELDT", "XXXX-XXXXXX-62006", nil, nil, "-2716.92", nil, "   \n ", "NEW MERCHANT", "", "\nUNITED STATES", "'320122830227852922'", nil, nil]
  end
  
  test "can parse row" do 
    parser = ExpenseParser.new( @row,@statement)
    parser.parse
    assert_equal(-2716.92,parser.target_instance.amount)
    assert_equal(Date.new(2012,10,9), parser.target_instance.date)
    assert_equal("NEW MERCHANT", parser.target_instance.vendor)
    assert_equal(Employee.first.name, parser.target_instance.employee.name)
    assert_equal(@statement, parser.target_instance.statement)
  end


end
