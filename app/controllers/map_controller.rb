class MapController < ApplicationController
  def show
    @wards = Ward.find(:all, :conditions => "name != 'Ottawa'")
    @ottawa = Ward.find_by_name('Ottawa')
    get_tables
  end

  def by_age_group
    @ward = Ward.find(params[:id])
    get_tables
    respond_to do |format|
      format.js
    end
  end

  def get_tables
    @pie_tables = Table.find(:all, :conditions => ['table_type = ?', Table::PIE_TYPE], :order => 'id')
    @percent_tables = Table.find(:all, :conditions => ['table_type = ?', Table::PERCENT_TYPE], :order => 'id')
  end
end
