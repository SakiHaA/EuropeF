class Public::LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end

  def new
    @league = League.new
  end

  private
  def league_params
    params.require(:league).permit(:name, :league_image, :introduction)
  end
end
