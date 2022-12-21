class Admin::PlayersController < ApplicationController
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

  def show
    @player = Player.find(params[:id])
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to admin_players_path
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to admin_player_path(@player.id)
    else
      redirect_to edit_admin_player_path(@player.id)
    end
  end

  private
  def player_params
    params.require(:player).permit(:name, :player_image, :league_id, :team_id, :introduction)
  end
end
