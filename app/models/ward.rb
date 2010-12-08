class Ward < ActiveRecord::Base
  has_many :points
  has_many :columns

  def column_for(row)
    Column.find(:first, :conditions => ["ward_id = ? and row_id = ?", id, row.id])
  end
end
