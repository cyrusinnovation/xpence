class AddColumnProviderToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :provider, :string
  end
end
