class Public::TeamsController < ApplicationController
  before_action :move_to_signed_in
  
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    @players = params[:tag_id].present? ? Tag.find(params[:tag_id]).players.where(team_id: @team.id) : @team.players
  end

  private
  def team_params
    params.require(:team).permit(:league_id, :team_name, :team_image, tag_ids:[])
  end

  #ユーザーがサインインしてない場合ログイン画面に行くメソッド
  def move_to_signed_in
    unless user_signed_in?
      redirect_to  new_user_session_path
    end
  end
end
