class StaticPagesController < ApplicationController
  DEFAULT_LAT = 40.466833
  DEFAULT_LONG =-79.938197
  

  def home
    if session[:game] == 'on'
      @game_mode = true
    else
      @game_mode = false
    end

    if @game_mode
      radius = 0.4
      latitude = session[:latitude].nil? ? DEFAULT_LAT : session[:latitude]
      longitude = session[:longitude].nil? ? DEFAULT_LONG : session[:longitude]

    else
      radius = 1.3
      latitude =  DEFAULT_LAT 
      longitude =  DEFAULT_LONG 
    end    

    @properties = Property.near([latitude, longitude],radius).geocoded.limit(300)
    @land_values = Property.near([latitude, longitude],radius).geocoded.sum(:land_value)
    @build_values =  Property.near([latitude, longitude],radius).geocoded.sum(:building_value)

    @rescues = Burden.count
    @prop_value = @land_values.to_f + @build_values.to_f

    @map_data = @properties.to_gmaps4rails do |property, marker|
      marker.infowindow render_to_string(:partial => "infowindow", :locals => { :property => property })
      marker.title "#{property.address}"
      #marker.json({ :owner => property.owner, :category => property.tax_category})
      #marker.picture({:picture => "http://mapicons.nicolasmollet.com/     wp-content/uploads/mapicons/shape-default/color-3875d7/shapeco     lor-color/shadow-1/border-dark/symbolstyle-contrast/symbolshad     owstyle-dark/gradient-iphone/information.png",
      #                :width => 32,
      #                :height => 32})
    end  
  end
  
  def impact
        @impacts = Suggestion.select("count(*) as cnt, property_id").where("property_id is not null").group("property_id").order("cnt desc")
    #@impacts = Suggestion.group(:property_id).having("count(*)>0").count
  end

  def points   
  end
  
  def delinquent
  end
  
  def income
  end
  
  def stats
  end
  
  def about
  end
end
