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
    #binding.pry
    @post1.save
    redirect_to player_posts_path(@player.id)
  end

  def index
    @player = Player.find(params[:player_id])
    @posts = @player.posts
  end

  def search
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    @player = Player.find(params[:player_id])
    render "index"
  end

  def show
    @player = Player.find(params[:player_id])
    @post = @player.posts.find(params[:id])
    @comment = Comment.new
  end


  private
  def post_params
    params.require(:post).permit(:team_id, :game_date, :stadium, :contents)
  end
end
