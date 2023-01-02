class Public::LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end

  def show
    @league = League.find(params[:id])
    @teams = @league.teams
  end


  private
  def league_params
    params.require(:league).permit(:league_name, :league_image, :league_introduction)
  end
end
