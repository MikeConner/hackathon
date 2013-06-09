class SuggestionsController < ApplicationController
  def new
    @game_mode = 'on' == session[:game]

    @suggestion = Suggestion.new
    @property = Property.find(params[:property_id])
    @property.burdens.create(:user_identifier => request.remote_ip)
  end
  
  def create
    @game_mode = 'on' == session[:game]

    @suggestion = Suggestion.new(params[:suggestion])
    if @suggestion.save
      redirect_to root_path, notice: 'Thank you for your suggestion!'
    else
      @property = Property.find(params[:suggestion][:property_id])
      render 'new'
    end
  end
  
  def index
    @game_mode = 'on' == session[:game]
    
    @property = Property.find(params[:property_id])
    @suggestions = @property.suggestions
  end
  
  def like
    @game_mode = 'on' == session[:game]

    @suggestion = Suggestion.find(params[:id])
    like = @suggestion.likes.create(:comment => params[:comment], :user_identifier => request.remote_ip, :positive => 'Agree' == params['commit'])
   
    like.errors.each do |attr, msg|
      flash[:alert] = '' if flash[:alert].nil?
      flash[:alert] += "#{msg}  "
    end
    
    redirect_to suggestions_path(:property_id => params[:property_id])
  end
end
