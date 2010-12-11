class AddRowType < ActiveRecord::Migration
  def self.up
    add_column :rows, :row_type, :string, :default => Row::NORMAL_TYPE
  end

  def self.down
    remove_column :rows, :row_type
  end
end
