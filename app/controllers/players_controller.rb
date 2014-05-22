class PlayersController < ApplicationController
  before_action :set_player, only: [:edit, :update, :destroy]
respond_to :js, :html
    has_scope :one, :type => :boolean
    has_scope :two, :type => :boolean
    has_scope :three, :type => :boolean
    has_scope :four, :type => :boolean
    has_scope :five, :type => :boolean
    has_scope :by_language
    has_scope :by_location
    has_scope :by_style
    has_scope :by_languageTwo

  # GET /players
  # GET /players.json
  
  #Steam ID - 76561197960265728  = 32 bit ID that is referenced in API, should have stored this fml..
  def index
    @players = apply_scopes(Player.all.paginate(:page => params[:page], :order => 'created_at DESC', :per_page => 20)).all
   
    
  

   
  #<td><%= link_to player.username, :controller => 'main', :action => 'stats', :accountID => player.playerSteamID %></td>
    #needs added to view to link to account
  end

  # GET /players/1
  # GET /players/1.json
   def show
     @players = apply_scopes(Player.all.paginate(:page => params[:page], :per_page => 20)).all
     
   end

  # GET /players/new
  def new
    @player = Player.new
    if session.key? :current_user  
    
#    if Player.exists?(:playerSteamID => session[:current_user][:uid])
     
#    end
    else
      redirect_to '/auth/steam'
    end
  end

  # GET /players/1/edit
  def edit
      @player = Player.find(params[:id])
      if session[:current_user][:uid] != @player[:playerSteamID]
        redirect_to root_url
      end
    
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to players_path, notice: '' }
      else
        format.html { render action: 'new' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to players_path, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:one, :two, :three, :four, :five, :rank, :language, :languageTwo, :location, :solommr, :style, :playerSteamID, :username, :email)
    end
end
