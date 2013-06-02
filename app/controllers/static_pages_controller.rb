class StaticPagesController < ApplicationController
  def home
    @map_data = Property.select { |p| p.mappable? }.to_gmaps4rails do |property, marker|
      marker.infowindow render_to_string(:partial => "infowindow", :locals => { :property => property})
      marker.title "#{property.address}"
      #marker.json({ :owner => property.owner, :category => property.tax_category})
      #marker.picture({:picture => "http://mapicons.nicolasmollet.com/     wp-content/uploads/mapicons/shape-default/color-3875d7/shapeco     lor-color/shadow-1/border-dark/symbolstyle-contrast/symbolshad     owstyle-dark/gradient-iphone/information.png",
      #                :width => 32,
      #                :height => 32})
    end  
  end
end
