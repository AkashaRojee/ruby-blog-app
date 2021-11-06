class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(text: comment_params[:text], user: current_user)
  end

  private

  def comment_params
    params.require(:data).permit(:text)
  end
end
