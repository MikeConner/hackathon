class SuggestionsController < ApplicationController
  def new
    if session[:game] == 'on'
      @game_mode = true
    else
      @game_mode = false
    end

    @suggestion = Suggestion.new
    @property = Property.find(params[:property_id])
    @property.burdens.create(:user_identifier => request.remote_ip)
  end
  
  def create
        if session[:game] == 'on'
      @game_mode = true
    else
      @game_mode = false
    end

    @suggestion = Suggestion.new(params[:suggestion])
    if @suggestion.save
      redirect_to root_path, notice: 'Thank you for your suggestion!'
    else
      @property = Property.find(params[:suggestion][:property_id])
      render 'new'
    end
  end
  
  def index
        if session[:game] == 'on'
      @game_mode = true
    else
      @game_mode = false
    end

    @property = Property.find(params[:property_id])
    @suggestions = @property.suggestions
  end
  
  def like
        if session[:game] == 'on'
      @game_mode = true
    else
      @game_mode = false
    end

    @suggestion = Suggestion.find(params[:id])
    @suggestion.likes.create(:comment => params[:comment], :user_identifier => request.remote_ip, :positive => 'Agree' == params['commit'])
    
    #redirect_to suggestions_path(:property_id => params[:property_id])
    redirect_to points_path, notice: 'Thank you for your opinion!'
  end
end
