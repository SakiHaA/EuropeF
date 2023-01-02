class Admin::LeaguesController < ApplicationController
  before_action :move_to_signed_in
  def index
    @leagues = League.all
  end

  def new
    @league = League.new
  end


  def create
    @league = League.new(league_params)
    if @league.save
      redirect_to admin_leagues_path(@league.id)
    else
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
      redirect_to admin_league_path(@league.id)
    else
      redirect_to edit_admin_league_path(@league.id)
    end
  end

  def destroy
    @league = League.find(params[:id])
    @league.destroy
    redirect_to admin_leagues_path
  end

  private
  def league_params
    params.require(:league).permit(:league_name, :league_image, :league_introduction)
  end

  #管理人がサインインしてない場合ログイン画面に行くメソッド
  def move_to_signed_in
    unless admin_signed_in?
      redirect_to  new_admin_session_path
    end
  end
end
