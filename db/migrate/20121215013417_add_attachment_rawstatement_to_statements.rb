class AddAttachmentRawstatementToStatements < ActiveRecord::Migration
  def self.up
    change_table :statements do |t|
      t.has_attached_file :rawstatement
    end
  end

  def self.down
    drop_attached_file :statements, :rawstatement
  end
end
