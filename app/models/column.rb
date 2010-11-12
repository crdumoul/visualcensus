class Column < ActiveRecord::Base
  belongs_to :row
  belongs_to :ward
end
