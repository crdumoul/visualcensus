class MapController < ApplicationController
  def show
    @wards = Ward.find(:all)
  end
end
