class SuggestionsController < ApplicationController
  def new
    @suggestion = Suggestion.new
    @property = Property.find(params[:property_id])
    @property.burdens.create(:user_identifier => request.remote_ip)
  end
  
  def create
    @suggestion = Suggestion.new(params[:suggestion])
    if @suggestion.save
      redirect_to root_path, notice: 'Thank you for your suggestion!'
    else
      @property = Property.find(params[:property_id])
      render 'new'
    end
  end
end
