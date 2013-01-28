require 'test_helper'

class AdminFlowsTest < ActionDispatch::IntegrationTest

  setup do 
    create :admin
  end
    
  
  test "admin has field to create new employee with email address" do 
    login_with_oauth
    visit('/employees/new')
    fill_in('Email', :with => 'rsmith@cyrusinnovation.com')
    assert page.has_content?('asdkjkjh'), "does not have content"
  end

end
