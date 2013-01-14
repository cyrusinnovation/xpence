class AddEmployeeIdToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :employee_id, :integer
  end
end
