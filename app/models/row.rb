class Row < ActiveRecord::Base
  belongs_to :table
  has_many :columns

  NORMAL_TYPE = 'normal'
  TOTAL_TYPE = 'total'
end
