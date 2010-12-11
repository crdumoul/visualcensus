require 'migration_strings'

class SetTableType < ActiveRecord::Migration
  def self.up
    MigrationStrings::PERCENT_TABLES.each do |table_name|
      table = Table.find_by_name(table_name)
      table.table_type = Table::PERCENT_TYPE
      table.save!
    end

    MigrationStrings::ABSOLUTE_TABLES.each do |table_name|
      table = Table.find_by_name(table_name)
      table.table_type = Table::ABSOLUTE_TYPE
      table.save!
    end
  end

  def self.down
    Table.all.each do |table|
      table.table_type = Table::PIE_TYPE
      table.save!
    end
  end
end
