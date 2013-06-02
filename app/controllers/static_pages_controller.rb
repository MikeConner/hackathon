class StaticPagesController < ApplicationController
  DEFAULT_LAT = 40.441783
  DEFAULT_LONG = -80.000117
  
  def home
    radius = 0.4
    latitude = session[:latitude].nil? ? DEFAULT_LAT : session[:latitude]
    longitude = session[:longitude].nil? ? DEFAULT_LONG : session[:longitude]
    
    @properties = Property.near([latitude, longitude],radius).geocoded
    @rescues = Burden.count
    @land_values = Property.near([latitude, longitude],radius).geocoded.sum(:land_value)
    @build_values =  Property.near([latitude, longitude],radius).geocoded.sum(:building_value)
    @prop_value = @land_values.to_f + @build_values.to_f
    @map_data = @properties.to_gmaps4rails do |property, marker|
      marker.infowindow render_to_string(:partial => "infowindow", :locals => { :property => property})
      marker.title "#{property.address}"
      #marker.json({ :owner => property.owner, :category => property.tax_category})
      #marker.picture({:picture => "http://mapicons.nicolasmollet.com/     wp-content/uploads/mapicons/shape-default/color-3875d7/shapeco     lor-color/shadow-1/border-dark/symbolstyle-contrast/symbolshad     owstyle-dark/gradient-iphone/information.png",
      #                :width => 32,
      #                :height => 32})
    end  
  end
end
