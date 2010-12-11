require 'migration_strings'

class ChangeTableNames < ActiveRecord::Migration
  def self.up
    MigrationStrings::TABLE_NAMES.each do |key, value|
      puts 'changing name of: ' + key
      table = Table.find_by_name(key)
      table.name = value
      table.save
    end
  end

  def self.down
    MigrationStrings::TABLE_NAMES.each do |key, value|
      table = Table.find_by_name(value)
      table.name = key
      table.save
    end
  end
end
