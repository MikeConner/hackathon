class PropertiesController < ApplicationController
  DEFAULT_LAT = 40.441783
  DEFAULT_LONG = -80.000117

  def show

    if session[:game] == 'on'
      @game_mode = true
    else
      @game_mode = false
    end

    radius = 0.4
    latitude = session[:latitude].nil? ? DEFAULT_LAT : session[:latitude]
    longitude = session[:longitude].nil? ? DEFAULT_LONG : session[:longitude]
    
    @properties = Property.near([latitude, longitude],radius).geocoded
    @property = Property.find(params[:id])
    @can_rescue = true
    @property.burdens.each do |burden|
      if burden.user_identifier == request.remote_ip
        @can_rescue = false
        break
      end
    end
  end
end
