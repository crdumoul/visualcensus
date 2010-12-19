class AddCategories < ActiveRecord::Migration
  def self.up
    names = %w(Population Diversity Housing Employment Income)
    names.each {|name| Category.create(:name => name)}
  end

  def self.down
    Category.delete_all
  end
end
