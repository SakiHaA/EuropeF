class Admin::TeamsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end
  
  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to admin_teams_path(@team.id)
    else
      render :new
    end
  end
  
  def edit
    @team = Team.find(params[:id])
  end

  def show
    @team = Team.find(params[:id])
  
    @players = params[:tag_id].present? ? Tag.find(params[:tag_id]).players.where(team_id: @team.id) : @team.players
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to admin_team_path(@team.id)
    else
      redirect_to edit_admin_team_path(@team.id)
    end
  end
  
  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to admin_teams_path
  end



  private
  def team_params
    params.require(:team).permit(:league_id, :team_name, :team_image, :team_introduction)
  end
  
   #管理人がサインインしてない場合ログイン画面に行くメソッド
  def move_to_signed_in
    unless admin_signed_in?
      redirect_to  new_admin_session_path
    end
  end
end
