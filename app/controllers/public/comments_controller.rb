class Public::CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment1 = Comment.new(comment_params)
    comment1.user_id = current_user.id
    comment1.post_id = post.id
    comment1.save
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :player_id, :comment_contents)
  end
end
