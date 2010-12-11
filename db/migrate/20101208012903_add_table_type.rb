class AddTableType < ActiveRecord::Migration
  def self.up
    add_column :tables, :table_type, :string, :default => Table::PIE_TYPE
  end

  def self.down
    remove_column :tables, :table_type
  end
end
