require 'test_helper'

class EmployeeFlowsTest < ActionDispatch::IntegrationTest
  
  setup do 
    create :expense
  end

  test "employee has multiple choices for receipt status" do 
    login_with_oauth
    find('.statementheader').click
    assert page.has_select?("expense[receipt_sent]", :options => ['No',
                                                                    'Lost',
                                                                    'Emailed',
                                                                    'Submitted Through Harvest',
                                                                    'Mailed',
                                                                    'In the Bin'
                                                                    ]), "Receipt dropdown not available"
  end

end
