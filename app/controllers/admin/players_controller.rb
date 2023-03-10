class Admin::PlayersController < ApplicationController
  before_action :authenticate_admin!
 
  def index
    @players = params[:tag_id].present? ? Tag.find(params[:tag_id]).players : Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to admin_players_path(@player.id), notice: '選手を追加しました。'
    else
      flash.now[:alert] = '未入力の項目があります。'
      render :new
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def show
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to admin_player_path(@player.id), notice: '選手を編集しました。'
    else
      flash.now[:alert] = '未入力の項目があります。'
      render :edit
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to admin_players_path, notice: '選手を削除しました。'
  end
  
  def search
    @players = Player.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  private
  def player_params
    params.require(:player).permit(:league_id, :team_id, :player_name, :player_image, :player_nationality, :player_age, :player_height, :player_weight, :player_introduction, tag_ids: [])
  end

   #管理人がサインインしてない場合ログイン画面に行くメソッド
  def move_to_signed_in
    unless admin_signed_in?
      redirect_to  new_admin_session_path
    end
  end
end
