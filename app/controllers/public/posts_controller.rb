class Public::PostsController < ApplicationController
  before_action :check_guest, only: [:new, :create]
  
  def new
    @user = current_user
    @player = Player.find(params[:player_id])
    @post = Post.new
  end

  def create
    @player = Player.find(params[:player_id])
    @post1 = Post.new(post_params)
    @post1.user_id = current_user.id
    @post1.player_id = @player.id
    #binding.pry
    if @post1.save
      redirect_to player_posts_path(@player.id), notice: 'レビューを投稿しました。'
    else
      @user = current_user
      @player = Player.find(params[:player_id])
      @post = Post.new
      flash.now[:alert] = '未入力の項目があります。'
      render :new
    end
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
  
  def destroy
    @player = Player.find(params[:player_id])
    @post = @player.posts.find(params[:id])
    @post.destroy
    redirect_to player_posts_path(@player.id), notice: 'レビューを削除しました。'
  end
  
  private
  
  def post_params
    params.require(:post).permit(:user_id, :team_id, :game_date, :stadium, :contents)
  end
  
  def check_guest
    if current_user.email == 'guest@example.com'
      redirect_to request.referer, notice: "ゲストユーザーは回覧のみ可能です。"
    end
  end
end
