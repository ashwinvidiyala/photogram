class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)

    flash[:errors] = comment.errors.full_messages unless comment.valid?

    redirect_back fallback_location: post_path(params[:comment][:post_id])
  end

  def destroy
    comment = Comment.find(params[:id])
    post = comment.post

    comment.destroy
    redirect_back fallback_location: post_path(post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id).merge(user: current_user)
  end
end
