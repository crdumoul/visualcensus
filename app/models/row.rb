class Row < ActiveRecord::Base
  belongs_to :table
  has_many :columns
end
