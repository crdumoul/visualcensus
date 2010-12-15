class Category < ActiveRecord::Base
    has_many :tables

    def pie_tables
      type_tables Table::PIE_TYPE
    end

    def percent_tables
      type_tables Table::PERCENT_TYPE
    end

    def absolute_tables
      type_tables Table::ABSOLUTE_TYPE
    end

private
    def type_tables(type)
      Table.find(:all, :conditions => ['category_id = ? and table_type = ?', id, type])
    end

end
