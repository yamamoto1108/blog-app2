class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path
      notice: "コメントしました"
    else
      render "posts/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(post_id: params[:post_id], user_id: current_user.id)
  end
end
