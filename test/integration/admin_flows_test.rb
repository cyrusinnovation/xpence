require 'test_helper'

class AdminFlowsTest < ActionDispatch::IntegrationTest

  setup do 
    create :admin
  end
    
  
  test "admin can create new employee with all relevant attributes" do 
    login_with_oauth
    visit('/employees/new')
    fill_in('Name', :with => 'Robert Smith')
    fill_in('Cardnumber', :with => 'XXXX-XX-1446')
    fill_in('Email', :with => 'rsmith@cyrusinnovation.com')
    check('Admin')
    click_button('Create Employee')
    robert = Employee.find_by_name("Robert Smith")
    assert robert
    assert_equal robert.cardnumber, 'XXXX-XX-1446'
    assert_equal robert.email, 'rsmith@cyrusinnovation.com'
    assert robert.admin?
  end

end
