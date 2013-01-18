require 'test_helper'

class StatementsHelperTest < ActionView::TestCase

  setup do
    @statement = mock
    @employee = mock
  end

  class StatementsWithEmployeesTest < StatementsHelperTest
    include StatementsHelper

    test "employee with complete statements" do
      @employee.expects(:statement_complete?).returns(true)

      actual = statement_status do
        @employee.statement_complete?(@statement)
      end

      assert_equal("complete", actual)
    end

    test "employee with incomplete statements" do
      @employee.expects(:statement_complete?).returns(false)

      actual = statement_status do
        @employee.statement_complete?(@statement)
      end

      assert_equal("incomplete", actual)
    end
  end

  class StatementsTest < StatementsHelperTest
    include StatementsHelper

    test "a complete statement" do
      @statement.expects(:complete?).returns(true)

      actual = statement_status do
        @statement.complete?
      end

      assert_equal("complete", actual)
    end

    test "an incomplete statement" do
      @statement.expects(:complete?).returns(false)

      actual = statement_status do
        @statement.complete?
      end

      assert_equal("incomplete", actual)
    end
  end
end
