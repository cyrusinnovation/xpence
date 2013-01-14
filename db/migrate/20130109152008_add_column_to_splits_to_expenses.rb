class AddColumnToSplitsToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :splits, :string
  end
end
