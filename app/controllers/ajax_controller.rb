class AjaxController < ApplicationController
  respond_to :js

  def set_location
    session[:latitude] = params[:latitude]
    session[:longitude] = params[:longitude]

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { render :js => "window.location.href = \"#{root_path}\"" }
    end
  end

end