require 'test_helper'

class StatementsHelperTest < ActionView::TestCase

  setup do 
    @statement = mock
    @employee = mock
  end

  test "should return incomplete if statement is not complete" do 
    @employee.expects(:statement_complete?).returns(false)
    actual = statement_status(@statement, @employee)
    assert_equal actual, "incomplete"
  end

  test "should return complete if statement is complete" do 
    @employee.expects(:statement_complete?).returns(true)
    actual = statement_status(@statement, @employee)
    assert_equal actual, "complete"
  end
end
