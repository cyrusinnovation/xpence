class AddColumnAdminToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :admin, :boolean
  end
end
