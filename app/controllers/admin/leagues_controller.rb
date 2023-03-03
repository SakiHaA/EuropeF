class Admin::LeaguesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @leagues = League.all
  end

  def new
    @league = League.new
  end


  def create
    @league = League.new(league_params)
    if @league.save
      redirect_to admin_leagues_path(@league.id), notice: 'リーグを追加しました。'
    else
      flash.now[:alert] = '未入力の項目があります。'
      render :new
    end
  end

  def edit
    @league = League.find(params[:id])
  end

  def show
    @league = League.find(params[:id])
    @teams = @league.teams
  end

  def update
    @league = League.find(params[:id])
    if @league.update(league_params)
      redirect_to admin_league_path(@league.id), notice: 'リーグを編集しました。'
    else
      flash.now[:alert] = '未入力の項目があります。'
      render :edit
    end
  end

  def destroy
    @league = League.find(params[:id])
    @league.destroy
    redirect_to admin_leagues_path, notice: 'リーグを削除しました。'
  end

  private
  def league_params
    params.require(:league).permit(:league_name, :league_image)
  end

  #管理人がサインインしてない場合ログイン画面に行くメソッド
  def move_to_signed_in
    unless admin_signed_in?
      redirect_to  new_admin_session_path
    end
  end
end
