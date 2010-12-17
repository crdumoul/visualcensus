class ChangeIncomeTableNames < ActiveRecord::Migration
  NAME_MAP = {
    'Total Income' => 'Income',
    'Male Total Income' => 'Male Income',
    'Female Total Income' => 'Female Income'
  }

  def self.up
    NAME_MAP.each do |key, value|
      table = Table.find_by_name(key)
      table.name = value
      table.save!
    end
  end

  def self.down
    NAME_MAP.each do |key, value|
      table = Table.find_by_name(value)
      table.name = key
      table.save!
    end
  end
end
