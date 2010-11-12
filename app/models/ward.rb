class Ward < ActiveRecord::Base
  has_many :points
  has_many :columns
end
