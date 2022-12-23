class Public::PostsController < ApplicationController

  def new
      @post = Post.new
  end

  def create
      @post = Post.new(post_params)
      @post.save
      redirect_to posts_path
  end

  def index
    @player = Player.find(params[:id])
    @posts = @player.posts
  end
    private
  def post_params
    params.require(:post).permit(:player_id, :name, :stadium, :opponent)
  end
end
