class Admin::LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end

  def new
    @league = League.new
  end


  def create
    @league = League.new(league_params)
    @league.save
    redirect_to admin_leagues_path
  end

  def edit
    @league = League.find(params[:id])
  end

  def show
    @league = League.find(params[:id])
    @teams = @league.teams
    # pp "teams", @teams
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
    params.require(:league).permit(:name, :league_image, :introduction)
  end
end
