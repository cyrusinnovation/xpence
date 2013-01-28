require 'test_helper'

class EmployeeFlowsTest < ActionDispatch::IntegrationTest
  
  setup do 
    create :expense
  end

  test "employee has multiple choices for receipt status" do 
    login_with_oauth
    assert page.has_select?("expense[receipt_sent]", "Receipt dropdown not available")
  end

end
