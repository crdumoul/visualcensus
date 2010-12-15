class MapController < ApplicationController
  before_filter :instantiate_controller_and_action_names

  def instantiate_controller_and_action_names
    @current_action = action_name
    @current_controller = controller_name
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
    @ward = Ward.find(session[:ward_id]) if session[:ward_id]
    @ottawa = Ward.find_by_name('Ottawa')
  end

  def ward
    session[:ward_id] = params[:id]
    @category = Category.find(session[:category_id])
    @ward = Ward.find(session[:ward_id])
    respond_to do |format|
      format.js
    end
  end

  def category
    session[:category_id] = params[:id].to_i
    @current_category = session[:category_id]
    @categories = Category.all
    @category = Category.find(session[:category_id])
    @ward = Ward.find(session[:ward_id]) if session[:ward_id]
    @ottawa = Ward.find_by_name('Ottawa')
    respond_to do |format|
      format.js
    end
  end
end
