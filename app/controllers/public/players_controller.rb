class Public::PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end


  def create
    @player = Player.new(player_params)
    @player.save
    redirect_to admin_players_path
  end

  private
  def player_params
    params.require(:player).permit(:name, :player_image, :league_id, :team_id, :introduction,)
  end
end
