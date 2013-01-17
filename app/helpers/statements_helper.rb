module StatementsHelper
  def statement_status(statement, employee)
    if employee.statement_complete?(statement)
      'complete'
    else
      'incomplete'
    end
  end
end
