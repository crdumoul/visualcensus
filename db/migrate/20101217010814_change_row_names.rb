class ChangeRowNames < ActiveRecord::Migration
  def self.up
    MigrationStrings::ROW_NAMES.each do |key, value|
      Row.find(:all, :conditions => ['name = ?', key]).each do |row|
        row.name = value
        row.save!
      end
    end
  end

  def self.down
    MigrationStrings::ROW_NAMES.each do |key, value|
      Row.find(:all, :conditions => ['name = ?', value]).each do |row|
        row.name = key
        row.save!
      end
    end
  end
end
