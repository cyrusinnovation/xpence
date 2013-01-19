require 'test_helper'

class AdminFlowsTest < ActionDispatch::IntegrationTest
  
  test "can create new employee with email address" do 
    visit root_path
    puts page.body
    #click_link('Sign in w Google Apps')
    #visit('/employees/new')
    #assert page.has_content?('New employee'), "does not have content"
  end

end
