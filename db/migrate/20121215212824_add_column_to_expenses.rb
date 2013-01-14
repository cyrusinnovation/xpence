class AddColumnToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :receipt_sent, :boolean
  end
end
