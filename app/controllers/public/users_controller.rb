class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end
  
  def favorite_index
    @user = current_user
    @favorites = Favorite.where(user_id: @user.id).all
  end
  
  def comment_index
    @user = current_user
    @comments = Comment.where(user_id: @user.id).all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name)
  end
end