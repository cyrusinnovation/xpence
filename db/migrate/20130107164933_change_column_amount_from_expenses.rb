class ChangeColumnAmountFromExpenses < ActiveRecord::Migration
  def self.up
    change_column :expenses, :amount, :decimal, :precision => 4, :scale => 2
  end

  # def down
  # end
end
