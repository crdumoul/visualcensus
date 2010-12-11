require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'migration_strings'

class AddOttawaWard < ActiveRecord::Migration
  @odd_rows = ['Male, total',
               'Female, total',
               'Total income in 2005 of males 15 years and over',
               'Total income in 2005 of females 15 years and over']

  def self.up
    ottawa = Ward.new(:name => 'Ottawa', :number => 0);
    ottawa.save!

    doc = Nokogiri::HTML(open(MigrationStrings.census_uri))

      doc.xpath("//table").each do |table|
        table_name = table.xpath("./tr/th/p/strong | ./tr/th/p/font/b | ./tr/th/h4/font/b").first.inner_text.strip
        print "Table: " + table_name + "\n"
        t = Table.find_by_name(MigrationStrings::TABLE_NAMES[table_name])

        t.rows.each do |r|
          path = @odd_rows.include?(r.name) ? "./th/p/strong" : "./td/p | ./td/div"
          row = table.xpath("./tr").find do |node|
            row_name = node.xpath(path).first
            row_name && row_name.inner_text.strip == r.name
          end
          value = row.xpath(path)[1].inner_text.strip.gsub(",","").to_i
          column = Column.new(:value => value)
          column.row = r
          column.ward = ottawa
          column.save!
        end
      end
  end

  def self.down
    ottawa = Ward.find_by_name('Ottawa')
    ottawa.columns.each {|column| column.destroy}
    ottawa.destroy
  end
end
