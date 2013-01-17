require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase 
  
  test "update from omniauth updates employee" do 
    email = 'example@cyrusinnovation.com'
    Employee.create!(:email => email)
    opts = {:email => email, :provider => 'google', :uid => 'abc123'}
    Employee.update_from_omniauth(opts)
    actual = Employee.find_by_email(email)
    assert_equal(email, actual.email)
    assert_equal('google', actual.provider)
    assert_equal('abc123', actual.uid)
  end

  test "update from omniauth with invalid email" do 
    opts = {:email => 'foo@cyrusinnovation.com', :provider => 'google', :uid => 'abc123'}
    actual = Employee.update_from_omniauth(opts)
    assert_nil(actual)
    
  end

end
