require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'migration_strings'

class AddTables < ActiveRecord::Migration
  @odd_tables = ['Male, total',
                 'Female, total',
                 'Total income in 2005 of males 15 years and over',
                 'Total income in 2005 of females 15 years and over']
  
  def self.up
    doc = Nokogiri::HTML(open(MigrationStrings.census_uri))

    doc.xpath("//table").each do |table|
      table_name = table.xpath("./tr/th/p/strong | ./tr/th/p/font/b").first.inner_text.strip
      t = Table.new(:name => table_name)
      t.save!
      
      if @odd_tables.include?(table_name)
        r = Row.new(:name => table_name)
        r.table = t
        r.save!
      end
      
      table.xpath("./tr").each do |tr|
        row_name = tr.xpath("./td/p | ./td/div").first
        if row_name
          r = Row.new(:name => row_name.inner_text.strip)
          r.table = t
          r.save!
        end
      end
    end
  end

  def self.down
    Row.delete_all
    Table.delete_all
  end
end
