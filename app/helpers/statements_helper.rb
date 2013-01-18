module StatementsHelper
  def statement_status(&block)
    result = block.call
    result ? 'complete' : 'incomplete'
  end
end
