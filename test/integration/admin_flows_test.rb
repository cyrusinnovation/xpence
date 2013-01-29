require 'test_helper'

class AdminFlowsTest < ActionDispatch::IntegrationTest

  setup do 
    create :admin
    login_with_oauth
  end
    
  
  test "admin can create new employee with all relevant attributes" do 
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

  test "admin can lock an expense once it is complete" do
    Capybara.current_driver = Capybara.javascript_driver 
   create :expense2
   visit('/Aldric%20Giacomoni/expenses')
   id = Employee.find_by_name("Aldric Giacomoni").expenses.first.id
   find(".statementheader").click
   within("##{id}") do 
     click_on("Complete(lock)")
     assert page.find('#expense_receipt_sent')['disabled'], "receipt sent not disabled"
     assert page.find('#expense_description')['disabled'], "description not disabled"
     assert page.find('#expense_client')['disabled'], "client not disabled"
     assert page.find('#expense_splits')['disabled'], "splits not disabled"
     assert page.find(".expensebutton[name='submitform']")['disabled'], "submit not disabled"
     assert page.find(".expensebutton[name='resetform']")['disabled'], "reset not disabled"
    end
  end

end
