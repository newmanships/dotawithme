class SearchesController < ApplicationController
  
  def index
    @search = Search.all
    
  end
  
  def new
    @search = Search.new
  end
  
  def create
    @search = Search.create!(search_params)
    redirect_to @search
  end
  
  def show
    @search = Search.find(params[:id])
    @players = @search.players
  end
  
  private
  
  def search_params
    params.require(:search).permit(:one, :two, :three, :four, :five, :language, :location)
  end

 
end
