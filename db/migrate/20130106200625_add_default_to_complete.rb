class AddDefaultToComplete < ActiveRecord::Migration
  def self.up
     change_column :expenses, :complete, :boolean, :default => false
  end
end
