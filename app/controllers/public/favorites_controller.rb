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
    redirect_to request.referer, notice: 'お気に入りに追加しました。'
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    #binding.pry
    favorite.destroy
    redirect_to request.referer, notice: "お気に入りから削除しました。"
  end
  
  private
  
  def check_guest
    if current_user.email == 'guest@example.com'
      redirect_to request.referer, notice: "ゲストユーザーは回覧のみ可能です。"
    end
  end
end
