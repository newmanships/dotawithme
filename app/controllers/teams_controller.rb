class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  
    has_scope :one, :type => :boolean
    has_scope :two, :type => :boolean
    has_scope :three, :type => :boolean
    has_scope :four, :type => :boolean
    has_scope :five, :type => :boolean
    has_scope :by_language
    has_scope :by_location
    has_scope :by_style
    has_scope :by_languageTwo

  # GET /teams
  # GET /teams.json
  def index
    @teams = apply_scopes(Team.all.paginate(:page => params[:page], :order => 'created_at DESC', :per_page => 20)).all
    
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
      if session.key? :current_user  
    
    else
      redirect_to '/auth/steam'
    end
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
    if session[:current_user][:uid] != @team[:leaderSteamID]
        redirect_to root_url
    end
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render action: 'show', status: :created, location: @team }
      else
        format.html { render action: 'new' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:one, :two, :three, :four, :five, :name, :rank, :description, :location, :language, :defaultMessage, :leaderSteamID, :username, :style, :languageTwo)
    end
end
