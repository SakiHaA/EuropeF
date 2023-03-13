class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @player = Player.find(params[:player_id])
    @posts = @player.posts
  end

  def show
    @player = Player.find(params[:player_id])
    @post = @player.posts.find(params[:id])
    @comment = Comment.new
  end
  
  def destroy
    @player = Player.find(params[:player_id])
    @post = @player.posts.find(params[:id])
    @post.destroy
    redirect_to admin_player_posts_path(@player.id), notice: 'レビューを削除しました。'
  end
  
  def search
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    @player = Player.find(params[:player_id])
    flash.now[:notice] = '検索結果が出ました。'
    render "index"
  end


  private
  def post_params
    params.require(:post).permit(:team_id, :game_date, :stadium, :contents)
  end
end
