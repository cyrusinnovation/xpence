module ApplicationHelper

  def complete_count(expenses_array)
    expenses_array.select{|expense| expense.complete == true }.length
  end
end
