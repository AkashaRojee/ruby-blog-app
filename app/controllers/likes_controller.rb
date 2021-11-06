class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = post.likes.new(user: current_user)

    respond_to do |format|
      format.html do
        if like.save
          redirect_to user_post_path(post.user.id, post.id)
        else
          flash.now[:alert] = 'Error: post not published'
        end
      end
    end
  end
end
