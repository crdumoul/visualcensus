class AddTableCategory < ActiveRecord::Migration
  def self.up
    add_column :tables, :category_id, :integer
  end

  def self.down
    remove_column :tables, :category_id
  end
end
