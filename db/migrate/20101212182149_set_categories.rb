class SetCategories < ActiveRecord::Migration
  def self.set_category(table_list, category)
    table_list.each do |table_name|
      table = Table.find_by_name(table_name)
      table.category = category
      table.save!
    end
  end

  def self.up
    set_category MigrationStrings::POPULATION_TABLES, Category.find_by_name('Population')
    set_category MigrationStrings::HOUSING_TABLES, Category.find_by_name('Housing')
    set_category MigrationStrings::EMPLOYMENT_TABLES, Category.find_by_name('Employment')
    set_category MigrationStrings::INCOME_TABLES, Category.find_by_name('Income')
  end

  def self.down
    Table.all.each do |table|
      table.category = nil
      table.save!
    end
  end
end
