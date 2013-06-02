class PropertiesController < ApplicationController
  def show
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
