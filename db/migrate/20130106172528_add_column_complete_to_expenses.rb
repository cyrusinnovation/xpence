class AddColumnCompleteToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :complete, :boolean
  end
end
