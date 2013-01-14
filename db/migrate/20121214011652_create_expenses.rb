class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :date
      t.integer :amount
      t.string :vendor

      t.timestamps
    end
  end
end
