class Public::CommentsController < ApplicationController
  before_action :check_guest, only: [:index, :create, :destroy]
  
  def index
    @user = current_user
    @comments = Comment.where(user_id: @user.id).all
  end
  
  def create
    post = Post.find(params[:post_id])
    comment1 = Comment.new(comment_params)
    comment1.user_id = current_user.id
    comment1.post_id = post.id
    if comment1.save
      redirect_to request.referer, notice: 'コメントを追加しました。'
    else
      flash.now[:alert] = "未記入でのコメントはできません。"
      render 'posts/show', id: params[:id]
    end
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to request.referer, notice: 'コメントを削除しました。'
  end
  
  private
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :comment_contents)
  end
  
  def check_guest
    if current_user.email == 'guest@example.com'
      flash[:notice] = "ゲストユーザーは回覧のみ可能です。"
      redirect_to request.referer 
    end
  end
end
