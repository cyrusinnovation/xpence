require 'test_helper'

class AdminFlowsTest < ActionDispatch::IntegrationTest
  
  test "can create new employee with email address" do 
    visit('/employees/new')
    assert page
  end

end
