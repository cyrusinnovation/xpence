class ChangeColumnReceiptInExpenses < ActiveRecord::Migration
  def up
    change_column :expenses, :receipt_sent, :string
  end

 #def down
 #end
end
