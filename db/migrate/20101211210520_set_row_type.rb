class SetRowType < ActiveRecord::Migration
  def self.up
    MigrationStrings::TOTAL_ROWS.each do |row_name|
      Row.find(:all, :conditions => ['name = ?', row_name]).each do |row|
        row.row_type = Row::TOTAL_TYPE
        row.save!
      end
    end
  end

  def self.down
    Row.all.each do |row|
      row.row_type = Row::NORMAL_TYPE
      row.save!
    end
  end
end
