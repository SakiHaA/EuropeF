class Public::TeamsController < ApplicationController
  before_action :move_to_signed_in, except: [:index,:show]
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_path(@team.id)
    else
      render :new
    end
  end

  def show
    @team = Team.find(params[:id])
    @players = @team.players
  end


  private
  def team_params
    params.require(:team).permit(:league_id, :team_name, :team_image, :team_introduction)
  end

  #ユーザーがサインインしてない場合ログイン画面に行くメソッド
  def move_to_signed_in
    unless user_signed_in?
      redirect_to  new_user_session_path
    end
  end
end
