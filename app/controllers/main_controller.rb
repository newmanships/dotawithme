class MainController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :auth_callback
  
  def index
#    @test = "searchText"
#    @test = params['playerSearch']
  end
  
  def stats
    #accountID is passed from /Players when a username is clicked on, to then go to stats page and load based on selected player

    if params[:accountID].blank?
      redirect_to main_mystats_path
    end
    @accountID = params[:accountID]
    @matchlist = []                                                                                                                                                   
      url = URI.parse("https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/v001/?key=#{ENV['STEAM_WEB_API_KEY']}&account_id=" + @accountID.to_s)
      res = Net::HTTP::get(url)                                                                       
      @matchlist = JSON.load(res)['result']['matches'] || []                                          
    end
  
  def auth_callback
    auth = request.env['omniauth.auth']
    session[:current_user] = { :nickname => auth.info['nickname'],
                                          :image => auth.info['image'],
                                          :uid => auth.uid }
    redirect_to players_path
  end

  def logout
    reset_session
    redirect_to players_path
  end

  def mystats
    @matchlist = []                                                                                   
    if session.key? :current_user                                                                     
      url = URI.parse("https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/v001/?key=#{ENV['STEAM_WEB_API_KEY']}&account_id=#{session[:current_user][:uid]}")
      res = Net::HTTP::get(url)                                                                       
    @matchlist = JSON.load(res)['result']['matches'] || []                                          
    else 
    redirect_to players_path
    end
  def about
  end

  def contact
  end

  end

end
