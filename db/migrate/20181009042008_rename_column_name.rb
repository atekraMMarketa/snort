class RenameColumnName < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :event, :signature, :signature_id
  end
end
