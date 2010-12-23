class Table < ActiveRecord::Base
  has_many :rows
  belongs_to :category

  PIE_TYPE = 'pie'
  PERCENT_TYPE = 'percent'
  ABSOLUTE_TYPE = 'absolute'
  OTHER_TYPE = 'other'

  def regular_rows
    Row.find(:all,
             :conditions => ['table_id = ? and row_type = ? and name not like "% rate"', id, Row::NORMAL_TYPE],
             :order => 'id')
  end

  def total_row
    Row.find(:first, :conditions => ['table_id = ? and row_type = ?', id, Row::TOTAL_TYPE])
  end
end
