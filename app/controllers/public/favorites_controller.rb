class Public::FavoritesController < ApplicationController
  before_action :check_guest, only: [:index, :create, :destroy]
  
  def index
    @user = current_user
    @favorites = Favorite.where(user_id: @user.id).all
  end
  
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    #binding.pry
    favorite.save
    redirect_to request.referer, notice: 'いいねを追加しました。'
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    #binding.pry
    favorite.destroy
    redirect_to request.referer, notice: "いいねを削除しました。"
  end
  
  def check_guest
    if current_user.email == 'guest@example.com'
      flash[:notice] = "ゲストユーザーは回覧のみ可能です。"
      redirect_to request.referer
    end
  end
end
