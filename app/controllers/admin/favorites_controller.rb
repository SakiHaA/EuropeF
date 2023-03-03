class Admin::FavoritesController < ApplicationController
  before_action :authenticate_admin!
 
  def index
    @user = User.find(params[:user_id])
    @favorites = Favorite.where(user_id: @user.id).all
  end
end