class Admin::PostsController < ApplicationController
  def create
    player = Player.find(params[:player_id])
    content = current_user.posts.new(post_params)
    content.player_id = player.id
    content.save
    redirect_to player_path(player.id)
  end

  private

  def post_params
    params.require(:post).permit(:stadium, :oppnent, :content)
  end
end
