class MapController < ApplicationController
  def show
    @wards = Ward.find(:all)
  end

  def by_age_group
    @ward = Ward.find(params[:id])
    @tables = Table.find(:all, :conditions => 'id != 1 and id != 12')

    respond_to do |format|
      format.js
    end
  end
end
