class Public::PlayersController < ApplicationController
  before_action :move_to_signed_in, except: [:index,:show]
  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def show
    @player = Player.find(params[:id])
    @post = Post.new
  end


  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to players_path(@player.id)
    else
      render :new
    end
  end

  private
  def player_params
    params.require(:player).permit(:league_id, :team_id, :player_name, :player_image, :player_introduction,)
  end
  
  #ユーザーがサインインしてない場合ログイン画面に行くメソッド
  def move_to_signed_in
    unless user_signed_in?
      redirect_to  new_user_session_path
    end
  end
end
