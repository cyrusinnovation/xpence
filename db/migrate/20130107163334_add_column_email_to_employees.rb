class AddColumnEmailToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :email, :string
  end
end
