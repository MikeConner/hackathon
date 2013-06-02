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
  
  def index
    @property = Property.find(params[:property_id])
    @suggestions = @property.suggestions
  end
  
  def like
    @suggestion = Suggestion.find(params[:id])
    @suggestion.likes.create(:comment => params[:comment], :user_identifier => request.remote_ip, :positive => 'Like' == params['commit'])
    
    redirect_to suggestions_path(:property_id => params[:property_id])
  end
end