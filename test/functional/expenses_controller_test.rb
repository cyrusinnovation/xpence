require 'test_helper'

class ExpensesControllerTest < ActionController::TestCase
  
  setup do 
    @expense = Expense.create!(
                              :amount => 10,
                              :vendor => 'McDonalds',
                              :description => 'Professional Development',
                              :receipt_sent => 'Email')
    @expense.stubs(:id).returns(1)
    @user = employee_with_expense(@expense)
    @user.admin = true
    @user.save!
    @controller.stubs(:current_user).returns(@user)
  end

  test "POST reset" do 
    Expense.stubs(:find).with(@expense.id.to_s).returns(@expense)
    post :reset, :id => @expense.id

    assert_response :success
    assert_nil @expense.description
    assert_equal @expense.employee, @user
  end

  test "POST lock marks expense as 'complete'" do 
    Expense.stubs(:find).with(@expense.id.to_s).returns(@expense)
    post :lock, :id => @expense.id

    assert_response :success
    assert_equal @expense.complete, true
  end 

end
