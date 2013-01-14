class ChangeColumnAmountInExpenses < ActiveRecord::Migration
  def up
    change_column :expenses, :amount, :decimal, :precision => 6, :scale => 2
  end

  # def down
  # end
end
