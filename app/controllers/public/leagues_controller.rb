class Public::LeaguesController < ApplicationController
  before_action :move_to_signed_in
  
  def index
    @leagues = League.all
  end

  def show
    @league = League.find(params[:id])
    @teams = @league.teams
  end


  private
  def league_params
    params.require(:league).permit(:league_name, :league_image)
  end
  
  #ユーザーがサインインしてない場合ログイン画面に行くメソッド
  def move_to_signed_in
    unless user_signed_in?
      redirect_to  new_user_session_path, notice: "ログインしてください。"
    end
  end
end
