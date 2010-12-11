class MapController < ApplicationController
  def show
    @wards = Ward.find(:all, :conditions => "name != 'Ottawa'")
    @ottawa = Ward.find_by_name('Ottawa')
    @pie_tables = Table.find(:all, :conditions => ['table_type = ?', Table::PIE_TYPE])
    @percent_tables = Table.find(:all, :conditions => ['table_type = ?', Table::PERCENT_TYPE])
  end

  def by_age_group
    @ward = Ward.find(params[:id])
    @pie_tables = Table.find(:all, :conditions => ['table_type = ?', Table::PIE_TYPE])
    @percent_tables = Table.find(:all, :conditions => ['table_type = ?', Table::PERCENT_TYPE])

    respond_to do |format|
      format.js
    end
  end
end
