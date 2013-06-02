class AjaxController < ApplicationController
  respond_to :js
  include ApplicationHelper
  
  def set_location
    session[:latitude] = params[:latitude]
    session[:longitude] = params[:longitude]

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { render :js => "window.location.href = \"#{root_path}\"" }
    end
  end

  def geocode
    location = geocode_address(params['code'])
    if location.nil?
      respond_to do |format|
        format.js { render :nothing => true }
      end
    else
      session[:latitude] = location['lat']
      session[:longitude] = location['lng']
      
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render :js => "window.location.href = \"#{root_path}\"" }
      end    
    end
  end
end