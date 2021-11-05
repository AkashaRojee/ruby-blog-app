class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show(id)
    @user = User.find(id)
    @posts = @user.recent_posts
  end
end
