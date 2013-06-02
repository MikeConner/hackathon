class StaticPagesController < ApplicationController
  def home
    @map_data = Property.select { |p| p.mappable? }.to_gmaps4rails
  end
end
