class Public::PostsController < ApplicationController
  def new
    @player = Player.find(params[:player_id])
    @post = Post.new
  end

  def create
    @player = Player.find(params[:player_id])
    @post1 = Post.new(post_params)
    @post1.user_id = current_user.id
    @post1.player_id = @player.id
    @post1.save
    redirect_to root_path
  end

  def index
    @player = Player.find(params[:player_id])
    @posts = @player.posts
  end

  def show
    @player = Player.find(params[:player_id])
    @post = @player.posts.find(params[:id])
    @comment = Comment.new
  end


  private
  def post_params
    params.require(:post).permit(:user_id, :player_id, :stadium, :opponent, :contents)
  end
end
