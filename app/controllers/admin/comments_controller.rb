class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @user = User.find(params[:user_id])
    @comments = Comment.where(user_id: @user.id).all
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to request.referer, notice: 'コメントを削除しました。'
  end
end