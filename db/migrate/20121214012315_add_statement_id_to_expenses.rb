class AddStatementIdToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :statement_id, :integer
  end
end
