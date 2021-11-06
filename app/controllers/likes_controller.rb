class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = post.likes.new(user: current_user)

    
  end
end
