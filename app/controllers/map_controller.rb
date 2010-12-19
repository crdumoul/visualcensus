class MapController < ApplicationController
  def index
    if session[:category_id]
      @category = Category.find(session[:category_id])
    else
      @category = Category.find_by_name('Population')
      session[:category_id] = @category.id
    end
    @current_category = session[:category_id]
    @categories = Category.all
    @wards = Ward.find(:all, :conditions => "name != 'Ottawa'")

    @ward2 = Ward.find(session[:ward2_id]) if session[:ward2_id]
    @ward1 = Ward.find_by_name('Ottawa')
  end

  def ward
    session[:ward2_id] = params[:id]
    @category = Category.find(session[:category_id])
    @ward2 = Ward.find(session[:ward2_id])
    @which_ward = 2
    respond_to do |format|
      format.js
    end
  end

  def category
    session[:category_id] = params[:id].to_i
    @current_category = session[:category_id]
    @categories = Category.all
    @category = Category.find(session[:category_id])
    @ward2 = Ward.find(session[:ward2_id]) if session[:ward2_id]
    @ward1 = Ward.find_by_name('Ottawa')
    respond_to do |format|
      format.js
    end
  end
end
