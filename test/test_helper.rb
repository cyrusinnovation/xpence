require 'simplecov'
require 'simplecov-rcov'

SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
SimpleCov.start do
  add_filter "test/"
  add_filter "config/"
end

ENV["RAILS_ENV"] = "test"

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "mocha/setup"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  def employee_with_expense(expense)
    Employee.create!.tap do |e|
      e.expenses << expense 
      e.save
    end
  end

  def statement_with_expense(expenses)
    Statement.create!.tap do |s|
      s.expenses << expenses
      s.save
    end
  end

  def expense_with_complete_status(completeness)
    Expense.create!.tap do |e|
      e.complete = completeness
      e.save
    end
  end
end
