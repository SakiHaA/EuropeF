class Admin::TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
  end

  def show
    @team = Team.find(params[:id])
    @players = @team.players
    # pp "teams", @teams
  end

  def create
    @team = Team.new(team_params)
    @team.save
    redirect_to admin_teams_path
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    redirect_to admin_teams_path
  end



  private
  def team_params
    params.require(:team).permit(:name, :team_image, :introduction, :league_id)
  end
end
