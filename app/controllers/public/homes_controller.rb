class Public::HomesController < ApplicationController
  def top
    @range = params[:range]

    if @range == "Player"
      @players = Player.looks(params[:search], params[:word])
    elsif
      @teams = Team.looks(params[:search], params[:word])
    else
      @leagues = League.looks(params[:search], params[:word])
    end
  end
end
