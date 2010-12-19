class MapController < ApplicationController
  def get_wards
    @ward1 = session[:ward1_id] ? Ward.find(session[:ward1_id]) : Ward.find_by_name('Ottawa')
    @ward2 = Ward.find(session[:ward2_id]) if session[:ward2_id]
  end

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

    get_wards
  end

  def ward
    @which_ward = params[:which_ward]
    if @which_ward == '1'
        session[:ward1_id] = params[:id]
        @ward = Ward.find(session[:ward1_id])
    else
        session[:ward2_id] = params[:id]
        @ward = Ward.find(session[:ward2_id])
    end

    @category = Category.find(session[:category_id])

    respond_to do |format|
      format.js
    end
  end

  def category
    session[:category_id] = params[:id].to_i
    @current_category = session[:category_id]
    @categories = Category.all
    @category = Category.find(session[:category_id])
    get_wards
    respond_to do |format|
      format.js
    end
  end
end
