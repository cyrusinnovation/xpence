class AddColumnClientToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :client, :string
  end
end
