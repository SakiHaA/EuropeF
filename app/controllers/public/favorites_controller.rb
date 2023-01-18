class Public::FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    #binding.pry
    favorite.save
    redirect_to root_path
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    #binding.pry
    favorite.destroy
    redirect_to root_path
  end
end
