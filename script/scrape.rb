#!/usr/bin/env ruby
require 'rubygems'
require 'open-uri'
require 'nokogiri'

$separator = ","
$ward = ARGV[0]

$odd_tables = ['Male, total',
               'Female, total',
               'Total income in 2005 of males 15 years and over',
               'Total income in 2005 of females 15 years and over']

def print_header_column(value, column)
  print (cleanse(value) + $separator) if column == 0
  print ("Ottawa" + $separator) if column == 1
  print ($ward + "\n") if column == 2
end

def cleanse(str)
  str.gsub("-", "").gsub("$", "").gsub(",", "").strip
end

def print_title_row(title)
  print cleanse(title) + $separator + "Ottawa" + $separator + $ward + "\n"
end

def print_column(value, column)
  print cleanse(value)
  if column == 2
    print "\n"
  else
    print $separator
  end
end

doc = Nokogiri::HTML(open('http://www.ottawa.ca/residents/statistics/census/wards/ward1_en.html'))

num_columns = 3
doc.xpath("//table").each do |table|
  column = 0
  table.xpath("./tr/th/p/strong | ./tr/th/p/font/b").each do |th|
    if column == 0 && $odd_tables.include?(th.inner_text.strip)
      print_title_row(th.inner_text)
    end
    print_column(th.inner_text, column)
    column = (column + 1) % 3
  end
  
  column = 0
  table.xpath("./tr/td/p | ./tr/td/div").each do |p|
    print_column(p.inner_text, column)
    column = (column + 1) % 3
  end
  print "\n"
end
