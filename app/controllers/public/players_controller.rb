class Public::PlayersController < ApplicationController
  before_action :move_to_signed_in
  
  def index
    @players = params[:tag_id].present? ? Tag.find(params[:tag_id]).players : Player.all
  end

  def show
    @player = Player.find(params[:id])
    @post = Post.new
  end

  private
  def player_params
    params.require(:player).permit(:league_id, :team_id, :player_name, :player_image, :player_nationality, :player_age, :player_height, :player_weight, :player_introduction, tag_ids: [])
  end
  
  #ユーザーがサインインしてない場合ログイン画面に行くメソッド
  def move_to_signed_in
    unless user_signed_in?
      redirect_to  new_user_session_path, notice: "ログインしてください。"
    end
  end
end
